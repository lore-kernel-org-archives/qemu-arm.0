Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD0C79F83
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 11:24:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2S2G-0001Es-9B; Fri, 04 Sep 2026 07:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2S2F-0001Cw-49
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 07:24:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2S2C-0004MY-Qr
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 07:24:42 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684AImWg2096466
 for <qemu-arm@nongnu.org>; Fri, 4 Sep 2026 11:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vCNCErGJBDQg0SgwIeGV7UD2RNQTRO8/KeVBpqxsSBQ=; b=jZUsfC7rdnT9Efrq
 A9Dgoe/1NtPvldhWzuubOld0kZoWiWQ8Jhx7zz7TsEyTOWx95B3lxMWLy5cw6V2x
 DkAGwzuFxWK9WpMO9ZpwALQHCNj7QmMuVbYk6wcv/gLV2zBtU0ZHSgawQ9O4I/xB
 ssA87Y8dXj4InfGYEquShCOQdahh7nwCxrC/a8+62Deq9+OSmB3MlBE6rVzo8d8h
 cJHfvLeWSYG00IrplW83FMqAZkg4wbS/Syr+1HWyyodV8+pf03Tt5QdiGJ7Kvwrz
 TMYzziBW9HWXQkdQffnNkpNxjtc/0ugzIzXKYLC7wBvuxw+f8TFQQa8r1MqbD2Y6
 /m/tUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqsb6k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 11:24:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936aa34873bso130882785a.3
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 04:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788521078; x=1789125878; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vCNCErGJBDQg0SgwIeGV7UD2RNQTRO8/KeVBpqxsSBQ=;
 b=IuP150yiTp33mmnWsKVPtqI0zmZVpnAq8vzG0r1qIv4lI48zf8iSM4Ea85oeLur1qV
 NFPYLDVOP3mhpQ2o+MJChF5fBV3GtWeClKpdIc9FnvVdGbz6Ib6FEA14/DhFSWDY2htP
 VmfzYmPybdSNDd+bAfAcJ49zo6TTSC4uMsJt9brqIL9B9RWmIUWI4IahtIxZmhtNpmmZ
 d8rjeazXajqgTnQTZKDLQV5LgqeUdbB2LenPvX8/wKWKVjVbB3HSulPBWFxx+VN4xckG
 pbmuErPNk1fluQXcSNMiRMUfCslfuFSc4LqYXIXE1rtwGT6DyVpeB1hyN9ySRjiKBhfP
 IZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788521078; x=1789125878;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vCNCErGJBDQg0SgwIeGV7UD2RNQTRO8/KeVBpqxsSBQ=;
 b=mlWtR3ziO78wcW/daqM0Vy0NCq29Z7s4hAk3t9mI5BZhodsgXGZBzc3UIYLaUmfcAq
 /iPw77+yUhbtSymQD/aF9JN6vVNXS+UJjm8ueqHQ6BvRpZpfbLhPLB+EAjQjwQbjegBg
 Pi3gQPAQUn7KLn5PoYN0QaodUjEzY1RXcX8sy3PX7FBM0ozucQRCktLsyOMxl7Q44c7I
 AE9lmTmNm9D5FZIyZz3hgQSrMLgwfga4KZMDXn6RXvr3TEPWEOjaNn/gQ67rkDlh9oui
 DjfuXaDEXpfwW37bSzbNvJvNVUwCqdaOoAK0B74F9U5XImHzskIwaN7DGVLI9Er0OsXZ
 ZbQg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwPQcZauR+Lrr2hjGBvBZpM7HCCinVNPnOKC+vlQgK3hrFBcpPiYTATpJu7uYTnFqdoLhVyN0sFLQ==@nongnu.org
X-Gm-Message-State: AFuF++kXrjyZ143qJIGCBersqtgzB7avo/vffDkanOllFAzVHaqkYfHz
 bHLLhpU+Alh6hORoKDU8OXDiPsxuJNX6iXyvIIuObxcRT92PDoYoZrHe+iRpSZ+fyhI+pmNLcUn
 GPFoL4GO1J409KEbKXEdLMRk7T4qYsXG1o04AbrtroZ8JrvYaG/S1V+k=
X-Gm-Gg: AYBFou3NAKIzrzkgcxKIBpKFEDikOiAOaqTzhqQHEHKosiZ9hmS1kbLM1iatSzWMFu9
 rebq/eZC6LrURwhHBMdWak605rWJqRnYqU9RrUIpzI6Pl66wDVxBRKXh4XUdojev8q67cCDgp1r
 vnVojKYQI0juZ6FOjSym8dYpi7yEMOJkhqqprCL564bN5bTEdgzevhtuww12FKf+cuuNo9K8fhI
 QIguHJje33NYPPSTPoBev7DgdTpWlHAMlz2STpaww+7k7cfpLkMgMBxQZfRWvWU2cgCg9fjrhcM
 d+bCWC1Y/MP3BpoTeHkXi6oF06580zeoRBvbp7wVfY2sjH9b0icRMDpIHBJvY0EGVl1ULMac1IP
 +f6X/01iy9uF2MXgqSAS3j9Agtx8DPxlQtA==
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id
 af79cd13be357-9398045fd75mr485296085a.36.1788521077804; 
 Fri, 04 Sep 2026 04:24:37 -0700 (PDT)
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id
 af79cd13be357-9398045fd75mr485290985a.36.1788521077307; 
 Fri, 04 Sep 2026 04:24:37 -0700 (PDT)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858bc74298sm3214831f8f.6.2026.09.04.04.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 04:24:36 -0700 (PDT)
Message-ID: <a8ced3da-7dfa-49c1-b65e-c2290e0f6ca7@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 13:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/33] hw/arm: Add basic Phytium Pi machine
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Anton Johansson <anjo@rev.ng>
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-3-bin.meng@processmission.com>
 <0795176d-4580-4acc-a3cf-c40f8d221661@oss.qualcomm.com>
 <CAEUhbmW4h_-az5iBsztzy8Yuu06+WMjOYcrL51sW8VEgyAaSMw@mail.gmail.com>
 <881be57e-5496-41f2-af0b-e21087fa5e54@oss.qualcomm.com>
 <apqcmqpJEEyc7wGx@redhat.com>
 <CAFEAcA-s+zsChqxYa258GOXdjniusdYeOCzGd6OiHWBQZV1Syg@mail.gmail.com>
 <apqfJ58nhZZIH8Su@redhat.com>
 <CAFEAcA_ZqLjPxo2GjW9vgvyVHw5iABphE91Dk7u+OAj3Ls3TMg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA_ZqLjPxo2GjW9vgvyVHw5iABphE91Dk7u+OAj3Ls3TMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEwMiBTYWx0ZWRfX0JP9328m3Akz
 MEGUMF785psjFwB4PUjPBrNQCGbay15RakVNpsr7WAtFRbj5D2Q4iM7/1eQSHLQy85vEAvFl/Yp
 hCywxqm1Fe8XiagJ0OR5pvSwI5aUfJw=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9aaa76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=fHW3kyu9qVaIUP2XLrYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEwMiBTYWx0ZWRfX7TUnBMs+eyeb
 3sTQTLjE3UBPHGTnL2XG3BYsJ08Q9clvruQ4sy2ti55YMiBB/D0snT+n5+z+WeEnVkI1Y1AVXue
 mG8RFpVFXDJ01tHJLX+pkRFT1x8jeOFUcpl5AKyUfsIISWAWNJwDrz3MuZCp2GyLAnMVjdjW3Jp
 +HMPzTZb4vuJUMLs1h1fXewHUBSkfZxmGEy9XVwIl7fN2BCGvyXhgJHXafc6ZdeytmO/TvHxoA5
 ukDf9mf3ESmJ2DHtqVFr3EajDAesTdAVrNGzqC9io/MR8O2oM2pr8yYo4kWv4dujovaqxQpXtNr
 E/BCiW5d94NfuqGy3eLoRceV++d8VWPtTVcZ/CjIpol2/O51LPJ5ckIhLEdsN5p1/uKVHOXIre5
 /i/afnLh9tLei41yZ6b3PgAPhjw3E8ZNdUXS2VIU7nuuiOSAnYflKm7zq2+9U/Z9koXNxobSdb/
 WzXPGUufCBXx0y4bKjQ==
X-Proofpoint-ORIG-GUID: 9PRH6-OodLhLmuGHyYAwgNqmwW5bSsFq
X-Proofpoint-GUID: 9PRH6-OodLhLmuGHyYAwgNqmwW5bSsFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040102
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/9/26 12:47, Peter Maydell wrote:
> On Fri, 4 Sept 2026 at 11:36, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Fri, Sep 04, 2026 at 11:28:35AM +0100, Peter Maydell wrote:
>>> On Fri, 4 Sept 2026 at 11:25, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> We need to use QAPI MachineInfo / MachineClass to report to mgmt apps
>>>> whether a machine is capable of using hardware acceleration or not in
>>>> response to "query-machines".
>>>>
>>>> Currently if a target supports HW accel, then apps assume that all
>>>> machines in that target can use acceleration. This was a convenient
>>>> short cut assumption, but this new machine suggests we can no make
>>>> do with that assumption, and need to explicitly report it per-machine.
>>>
>>> That assumption has never been true for Arm; this new machine
>>> type is no different to any of our existing boards in that regard.
>>> Support for KVM etc is only present for the 'virt' machine type and
>>> one or two others. Most of the rest don't work with KVM because they
>>> create a specific CPU type (not 'host' or 'max') and that won't work
>>> with KVM, or (as with sbsa-ref) because they want EL3 support and
>>> KVM doesn't provide that.
>>
>> Oh, then the problem is already way worse than I realized which
>> really makes we think we should consider exposing whether
>> machines can use HW acceleration or not.
> 
> It also depends on the options to the machine, so for instance
> this should always work with any of the hw accelerators:
>   qemu-system-aarch64 -M virt -cpu host
> but this wants nested virt, so only works with a hw accel
> that supports that and a host kernel that has the KVM side support:
>   qemu-system-aarch64 -M virt,virtualization=on -cpu host
> and this wants EL3, which won't work in any hw accelerator
>   qemu-system-aarch64 -M virt,secure=on -cpu host
> 
> Similarly the interrupt controller choice matters, so this:
>   qemu-system-aarch64 -M virt,gic-version=2 -cpu host
> may or may not work depending on whether the host CPU has the
> GICv2 back-compat support; and this:
>   qemu-system-aarch64 -M virt,gic-version=x-5 -cpu host
> is currently TCG-only. (But also it's experimental so you kind
> of know you're off-piste here ;-))
> 
> If you try the things that won't work with -enable-kvm then they
> should wind up causing QEMU to exit with a hopefully more or less
> informative error message, but I don't think we have any mechanism
> for introspection of the form "if I try this particular set of
> QEMU options is it going to work?" short of actually trying.

I recall some discussion with Markus / Paolo when brainstorming
declarative dynamic machines, we'd need another MachinePhase
iterating on all selected types to instantiate and check whether
they can be instantiated, and returning impossible config error;
way before a property is evaluated on an instance at Realize time.


Here IMO accelerators should report whether a CPU model class
requested is accelerable or not (then later we can double check
with features updated on the model instances).
The machine deciding is a shortcut, not scalable and hard to maintain.

