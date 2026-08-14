Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7185C5CFC1
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Aug 2026 05:58:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wukw2-0001py-FW; Fri, 14 Aug 2026 01:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wukw1-0001pi-AV
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 01:58:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wukvx-00050X-0g
 for qemu-arm@nongnu.org; Fri, 14 Aug 2026 01:58:28 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E4QWWs4043014
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 05:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KnFFQqkGI4XvAaq2e5N7tSGoQVWyfWiwdrlReHyet+c=; b=DisI0mq+6urzuPC6
 uohqhaIQTrXbGuLKOWZWth8e7G3Mow0k8l3B0ffA+6JwqXV5k8EyJT0w5EZ9E+qM
 PqgOQoJxhqBDOyJHx3kh0gVbiCB+XGJi85PMXkxTHc+Iy10BWybJ4/6nO/Kle4kd
 rva4pb5HsumEHpefpv0hNcsAJe+botykUqge4D5Wb6b4YpfcpPRG2PAbAFclsCwM
 txPlbKKxdlpZL3v5KZP7Sow45YCFUdC3XAT6WUnXK7t91/EUNUVrxs2djRPPzZh1
 uZWgN0cUD8i4+aV4EoDEaDLWdMo4eve7PCwwQNPAVr+g9Srq/Z/0d0sDnU6ncLkh
 tI7XAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42hw1r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2026 05:58:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c083f1818so8328991cf.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 22:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786687102; x=1787291902; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KnFFQqkGI4XvAaq2e5N7tSGoQVWyfWiwdrlReHyet+c=;
 b=g7qH11T1NSMhLoFOXAuWsHt/PyFS1GgEeJezBQF69+No8L7z422GSo5uL2oaoUKNNQ
 v/Ay9udaVbpwIOTCGRE07g13ZFlf3XLdiyCqRQ/Y8yBVwCNn4BNXPJb58ytNSm0zN+AD
 S/WP58qS6Xu0MJlm3ePQEQWlnbCZDJsd5A/Vfd2hYRWfnHpR1/cxPyHgszwD1kiQGSj+
 JUK6TI6VP15P/cULdE1PXgcl5OutRlYWAW+5U9HNWnGgBZXKovMgbbufm+J0jHHprYaa
 BysHC6gw2tUsf5HjHzMdkf8mdVDP8GkyXNiPDF3t0L/2v2sP54p3/Glwwa1BSxWQQxW9
 HloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786687102; x=1787291902;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KnFFQqkGI4XvAaq2e5N7tSGoQVWyfWiwdrlReHyet+c=;
 b=aruP6D1GgAiDL6zMWRU6khmL1MIM/smHoj1tPWu1piVfzsfBMmAH3fwGzr0hY9g1mA
 WdAJjjSG5HcmmI8VGZc+aless2NxXwZK9sAR7DdCghMILrH9vu0tW6N3zACTSSdm4s9o
 LucdxFCjZteahyw48lYhBZpdB3tuX8f9UP8TtEshouGil1d/k53PBo9/pFugT2sREWmb
 a39Ng7BHrs87nyQ8RUOT3CPjGAcv9GYF0bNJvwv5Ow4Wq6kv/9Vmv8E+B/RRvstppVmW
 GQifYZC3fR9MiZ18v8CP4uIAsBAzLduzY8gyvD+FY4K17vD/iQNuz2SprWK24Y8sodU3
 KOcA==
X-Forwarded-Encrypted: i=1;
 AHgh+RojgiwmGTXfM5/P1OAHruKpx2b2QvLgB0hYfzGM44e35Ee3sf7hYJjMH4NvPtw8cg4QqR4zdhXgpQ==@nongnu.org
X-Gm-Message-State: AOJu0YyfyozADwMaFSTCmbSAusaXbCpoN8vb32bS3HaI8/RkkpE45IE2
 9YCdnT9ZvlHSh7XqZ3wAtU0+Gzi1XzF8wz4jttI5wAI19/7FviWEIm92Bok0Ho3gxf1dBscPSQl
 s8iWEB+vfNJjl1rmo8Cru2Nh8R1LIPotaRUjWOfBEnCdFQ+ckIadtujI=
X-Gm-Gg: AR+sD11wE9xxHOVdr19rzj9q1FDMrK18hLsk+1jdwJWmtpGfUqqwnljGmRTA6pi3aQ4
 TWp5fmx3/DN9dRPeMPtc+BPEPwWXYqUBKPlA11yWdHSwIvLCa7PXRR9n/EPqNrP/rvt1++YW0rf
 zfvA7yfQCUKHnOfCu4DTrpJ3KAswRza5wFx/ef3WqUiRpKOxWCKAb1oqE+/zcZEnyfllJSjCHpT
 5e9PH36oSSWzCI/iuJL8rVYaf0POCrisfnRpPp2Ur+h120EAHfwqZDCdyX7F6VsGJtIyoAgdcUV
 SkeWdKe/2u5Fq3l3lGU38otvhGbxyEBe74q5Zn5vCmxJHK7TYUkY4c2ZyM/dhKeT3FKoMWKdgd3
 YdawDqgcBOOlygPSRjWFDpOG2GZhm3r/UBn0=
X-Received: by 2002:a05:622a:15c5:b0:51c:2022:cef5 with SMTP id
 d75a77b69052e-52d855014bamr36998031cf.26.1786687102290; 
 Thu, 13 Aug 2026 22:58:22 -0700 (PDT)
X-Received: by 2002:a05:622a:15c5:b0:51c:2022:cef5 with SMTP id
 d75a77b69052e-52d855014bamr36997751cf.26.1786687101882; 
 Thu, 13 Aug 2026 22:58:21 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49989af26eesm919055e9.15.2026.08.13.22.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 22:58:21 -0700 (PDT)
Message-ID: <e3f42f40-7cb0-489b-9cb8-6181317b1f16@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 07:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] hw/arm: Store the ARM boot info in the machine state
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goat?= =?UTF-8?Q?er?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Hao Wu <wuhaotsh@google.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Jan Kiszka <jan.kiszka@web.de>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Troy Lee <leetroy@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm@nongnu.org
References: <20260813154918.996812-1-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260813154918.996812-1-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7eae7f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NUi-4xgm_u2QagYK-hgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ySwCk5uAwoD0ZciipF-t_npAouN8U1rq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA0NCBTYWx0ZWRfX5LmC4iPuukqu
 RqyJp9BnBrkMZBtoN9DpLNrJQeJS3ogbPSVX9GYMhrjflx/P8rAStZ9Tnlt03dxUdbsWV8Rw9AB
 +om6TcAUMvHOYMiC9m3chgkyTcyxKF9ksaOynn0Si47AoYCIJySFK5INwrvKxso77fCN5eQric5
 FBfVOa/lWDSSvtDUvQsjqW2DriYTWvqlDgqWKwFM7kKp6CqQG14GXZ99qlI6yISeHAfhmvBb8Ml
 8CgaPMMe+m/1nPpcrMpyGxmlvsEwoZZwj+w6Wt3zoc651VzUiya+EH8mffHR8ZES+SH8KKlDnMV
 lFrCm3Z+70pF5Thrl45fsKUr/TGNLAR/xKc4nX8Ztyo0kamYO6NeG+gy9f7Owpn2LUqq6Gamw1l
 RXSb7MW4qs34cucYV+EfB5FW1bY6JZR2hKARKMPo+5X04M0R9ynFUujM01gd6xy2AQYmb9Hfl+O
 J946rwnTRi60m2iZVPw==
X-Proofpoint-GUID: ySwCk5uAwoD0ZciipF-t_npAouN8U1rq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA0NCBTYWx0ZWRfX9k59L/U5rtyy
 ZJsvtfY2DWxw3wVXxq+xm9KlxUs4wgxxpgf4sCR4FCBaVBkdJZhoBBQ4Z5GmJxEYiOlF62a8sA4
 yCqCqVPpdMH/0pF6mdudm6/dqTXOGzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140044
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 13/8/26 17:48, Bin Meng wrote:
> 
> Most ARM board files declare their struct arm_boot_info as a static
> object at file scope (or, occasionally, as a function-local static
> inside the machine init function). arm_load_kernel() stashes a pointer
> to that struct in every CPU and dereferences it from do_cpu_reset() on
> each reset, so the boot info conceptually belongs to the machine for the
> lifetime of the VM, not to a static object whose ownership is left
> implicit.
> 
> This is a longstanding leftover pattern: modern machines such as virt,
> raspi and xlnx-zcu102 already keep the boot info in their MachineState
> subclass. This series converts the remaining machines that still use
> a static object, moving the struct into their machine state so that its
> lifetime and ownership match how arm_load_kernel() actually uses it.

I wanted that cleanup since a long time, excellent, thanks Bin!


