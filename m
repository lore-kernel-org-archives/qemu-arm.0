Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C46FCC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 12:07:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGbHg-0004ac-6o; Tue, 13 Oct 2026 08:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGbHd-0004aB-Aw
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:07:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGbHb-0002wE-NI
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 08:07:05 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D89Bmd3054903
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 12:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CcrxFDLUN7nH8+98YRNlB//TYvu+hvNBbiWX5IGI7Ns=; b=ZFs+YO7voQcDp00s
 8CI6qLM/sgGijJgSsfhw95qoSXJjquaNwnsWdfqKUwGvjfH9C/rzxAlfo1SDimKF
 xrGXdh9S6DFEVRmOb2ktvW/kSyBmGXEx4Qu+NQNif7GJ5sbRZtPvyPVPZKwa44Jb
 Qpa1FijZwH5/U2kyl25iv8z5d4Rij8ilMfCfRdFMk5H3C2usbX5z77G/5Sx/SVoP
 SaoCefjhRlq5NygWv92zTPRL2aJGVmZLnw5G969UJ9Ng+HHKwA5HCOX2t4rX+hoi
 QV4zaeVMuHssBV6pE0XrNoQEB2I1oi3pOy/QvUnilk9LcABmX5/pgN9VVkBeMVTE
 G0i4Vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aev6kc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 12:07:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-939c30aa9a0so269809985a.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791893217; x=1792498017; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CcrxFDLUN7nH8+98YRNlB//TYvu+hvNBbiWX5IGI7Ns=;
 b=gYCXAfu+pXK7zFmKj/Gs4Z3kWZhs7cPoTPZsi2kCHnuLaQ7mDUWWOzdDsNLqAop5wn
 8ZthBDGqCYzeB++jegDnCJJEUiLG4s6zX/zm9tbyiZjCl2AlGVe3pbjEH6ou3qA7d99E
 EmdquBkePJwe5Gr/EkOit/fshm4vVQEXMvQkGRCrfpH6Fkd/lsn5R9lBjhDYnNZDutuG
 2G5kfXVHY+KK3fsJ/2jqSElaeKHn6NWXnm/hnbrqeOxLpjYzw5+AV8UBQQwpvt7vboPM
 Vd45N34/ocVYqsgbZMinFwDeFu4MN05/SazJ1jQrjS87PMb3LtaJvcyj+QfF0/Z+PcIE
 eDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791893217; x=1792498017;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CcrxFDLUN7nH8+98YRNlB//TYvu+hvNBbiWX5IGI7Ns=;
 b=CPiD/qGds4rbUPZCpiVkTIXss0X9f38cQlKV63tsadCyckoaRZAigXtRltarWrrSmH
 npqKlNznseIgpvs+MlpzwSzKxoVpG9MTqYxgS4HP4m7a2vewJIr8kzx8RVBOqvO5ZBx4
 pr0nIvlPLZ0Y2oY17GfQ48gb+eJo/HrRqoQnFe+Y0eDPjN5bkGOFIGCF6zaSmLGEyPUE
 aAR5Im5KkNC1cxJy5BAO0yYI21e6iGyBValBY2CoBF7STY4jJloFsjKHp05WK5fxb0bi
 8RdvqMKT4myvdfammIuILU8j4s87UXLlYalboNi3JgRepzGP15kQe8QrfCB2yDGuJMI+
 G1IQ==
X-Gm-Message-State: AFq9FYL2k6fXwGUgq64UgmoeaZyqsGZKVKvPdmzxyIl3KeafVsma7Xj7
 9BOCxsZ4ArMihF6GySdenAWMOgLcvpZDb/ewtcB/MQRA18vOHkR03IkGzuupgKf324nnwUIb6fO
 AZpMnqOymOfmkcaK4EBEF+pbAuwlUhSRdoTRv2EROwzbQF7n09uZDiWE=
X-Gm-Gg: AYBFou22N77Dna23YIl6iHOb8uuJwE0GMBlooUNUMxiSj02o1Md1FK4f7eMhBqXlcBV
 61/pAoVXAmjJos/++SnIsAlLRJ1aqR1j1VY/9qVDelKuxfAgE43mpZIF2n5Y1t5VDetbzeh1lim
 QS4hirEMG3PCzA3atY3uwGNGNUKiBTRK/4pXXGfUpUz0m24bU5CMOX7fn/OPHpmX+5r0Xf530cA
 bBL2yZVpAhCIm5cU2QB5DUdKYaCUmAArdXRaePuJI2z8AD2uwLeWQpH2QG7P6hz59rx9jTAiNBV
 TD/eDVT2pPToQnrBkMuJX7R8blwlv9cRMHEywJ3kE82KlK3y07QjVCCvJxkkZkGcz5psyF1Js+7
 989qE48rQK5q2MzT83Af5i3zdePPoXmN1aQ==
X-Received: by 2002:a05:620a:2985:b0:93e:910c:5e65 with SMTP id
 af79cd13be357-93ebd26b66fmr1955730685a.49.1791893216619; 
 Tue, 13 Oct 2026 05:06:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93e:910c:5e65 with SMTP id
 af79cd13be357-93ebd26b66fmr1955724985a.49.1791893216073; 
 Tue, 13 Oct 2026 05:06:56 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab4764sm4501724f8f.25.2026.10.13.05.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 05:06:55 -0700 (PDT)
Message-ID: <efb6cae0-f340-4a7f-8d4e-9afb3924dcde@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/86] hw/intc/arm_gicv5: Implement virtualization support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <de4fe97a-83ff-4f56-b3ba-f506d03e252e@oss.qualcomm.com>
 <CAFEAcA8w9yQCr4gH+iOwX5V7A3BcHQTS33OgD-recLR3MDG8dw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA8w9yQCr4gH+iOwX5V7A3BcHQTS33OgD-recLR3MDG8dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -D80MDGXrBmpOzGLOeOFrFN3a09wk7Zl
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace1ee4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1IPZhD4_ZTGOByvONrIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OCBTYWx0ZWRfXyzm4R3umZrM6
 9FfqG84YC8/CdacFdR1imd81GwvoRVI4oFU7TGkWgUE1wT0aj9TOPaU4ipDuiSoXd5ZKCeFRU2i
 1p+bsjE9v4soHiEsO5A3qZGGV3vFd/k=
X-Proofpoint-ORIG-GUID: -D80MDGXrBmpOzGLOeOFrFN3a09wk7Zl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OCBTYWx0ZWRfX4xb/cQh61nXh
 hQJNZJga204z0GaLgoWzsaM4TvXh6VPzD0c23PnpqX77DIlMeroUZZNm5uePivi//KhWbguIcs4
 eql6X9h3Ya8gMK+ScXmWAj+ai2FenkiR29bVP5Dl0WSa0+i6JPOXbfoi4AUbDXd/TuIr2pcRUhe
 YW9hHDq2dW9lFdv3/mNC+L/N1i+FF9GfhefbSOJpmlwl7PdmDO/efzt47imDwfyTW69DdEr8UG2
 yX8R8rc2D4NJ3khVXLekiZNMdiPjd+PZILQWQqFaUmNsh5kH+Rc9AICW06Hp/5j+o4CAMPGGwLC
 jAIO/jhAGjXk+uQh1mN4h1cjI94iUwg81zHU/OPFJZXqpzOsjuO7VaggvhdCzdOyHXyKFAADijB
 u7i/VOZpNVA6EoLxku8OjgAtYNoNrLHaSWbuDXzuDVbcbIfeJGGE6dte0QDSlWxPwYYBM/nPpP2
 8wIkdwLEdjX57nm44EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130048
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/10/26 12:51, Peter Maydell wrote:
> On Tue, 13 Oct 2026 at 11:30, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:


>>> The kernel support for using GICv5 virtualization is not yet in
>>> mainline, but it has landed in the kvmarm/next tree:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
>>> Similarly kvmtool support to run the inner guest is still work
>>> in progress, but the tree at
>>> https://gitlab.arm.com/linux-arm/kvmtool-sb.git gicv5_wip
>>> will work with the kvmarm/next tree.
>>>
>>> This series can pass the kernel's vgic_v5 selftest, and boot an
>>> inner guest to userspace with kvmtool.
>>
>> Could we have a functional test similar to
>> tests/functional/aarch64/test_kvm.py?
> 
> kvm-unit-tests currently has no support for GICv5.
> We should be able to have some kind of functional test eventually,
> but it will need to wait until the kernel patches at least have
> hit mainline.

What Alex usually does is build an image and store it in
share.linaro.org (previously fileserver.linaro.org, see
commit ebbc04adbb079066f8d180b8744c1c01c6de23f9 for example).
Better would be to store a tarball with reproducible steps
and binary. That would be the custom kernel + kvmtool, allowing
to have coverage and test regressions on QEMU side. We can still
update / remove when Linux support is merged.

