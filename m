Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE20606A32A
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YxVUQQZj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8sxOyIX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT5he-00037n-FO; Mon, 16 Nov 2026 18:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT5hD-0002z1-3h
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 18:01:09 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT5hA-0001RD-4i
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 18:01:05 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJfGr82247110
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 23:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8FSK5NmQa4bmfeBB0Se7Kwd5Lia+vHD2EGIYcu2Jkzs=; b=YxVUQQZj+SXuHvCg
 Haf3rxtVoDZHSdJmXc2d8It1WvkVMA921Yi4HDuQKojXBE7R3erMsmPvsohhVG0A
 lSeFJF3ji8LV44mRBVOM12axHXBuhHk1q/bXrPxGkQFa9JVnM31EzDxAmDaeuOcp
 ELW/kt5p4ok2U2y7y9X6BXSU1dfv7u3nDRNMhfT5PZOZQDMYOO0IgsjfMas0CQi9
 9yOwRx8ly/SgKHz4vmh9BTeZcVCQHYN4EVwJL5ViqDieDk9YtiYU6oa2/wcK6ai7
 TrQLV/8YzIDmMVbN2OY8S7f34YYHWAh5qlqWqSaQJwxm2AH7CfjphOsIyqeeBnxr
 zuQORg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqyax6t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 23:00:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-94960131befso480557085a.0
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 15:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794870051; x=1795474851; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8FSK5NmQa4bmfeBB0Se7Kwd5Lia+vHD2EGIYcu2Jkzs=;
 b=B8sxOyIXvTIwF3kbDmj7xcKfOe+SbX6wDWjudsJGQUGuzFnnfRYChkxJzybo5HbTRl
 aI6Shr/txLw7eOa59k3fOmiFHWI2bWvHU0C7/6p0DPWwNiR0aIc49mJum9hrKbtmDu7D
 ZoDtjNMZbsXAYhzOJobe93Rl3uLYis7FkfEQQxrveSz2zXVMhCFsxrtNGPrCQbbD2mfj
 1jK9akCwlmUMNFpclzAoDzJd5aiZPl9qOTpncXise4kEYJZunvFldieljIHehPCI40EP
 O6ZBHZsFpbPP/yHD5lS9YLRAjwowzekPQe+CiKtO9edpaHnjNtSnJ3V7gf6K3r462GTb
 aGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794870051; x=1795474851;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8FSK5NmQa4bmfeBB0Se7Kwd5Lia+vHD2EGIYcu2Jkzs=;
 b=brlPAefdYEJlEgrjhoqhJOzdpVKDhjU5Wsa+swpAEPPRRJ2+th80fBOkG1hVE4JQGG
 LXnAZvYxI2E5O6Y2jsLrutzvD5B8QjEwxxbFb39DDz1X+0k3wM55iUQp92r3GHYVleAt
 AI/Vz489qHl1FyBvroGcESKtvLf4tG3H5OIL028b8zHLlnfHawRy1LJziCV5cIPU+eHM
 StRM3NtTGManVqMZ8u0cTWyFWg3am+oYgv2CAXJni/2J5X1ZW8jzctjphWZeOuB4RtXz
 qB54nFlhcpUtL9vTg7Aaz4koSj5fsVUCXVpmPgm3DFDQiuyLwfTTGAqzwlKCBXBHYPY0
 xrBA==
X-Forwarded-Encrypted: i=1;
 AL+hErFpiGqgxeG07mhOfFGS5O6VOIxgXqgA3L1h9VZGlGcgs4drbIzxTIorgwCq8a+IdhXmdJ3sYh4ZLg==@nongnu.org
X-Gm-Message-State: APuU4Z/qckgx2kkPepEliWHPjbxnc+qdjpolXQ9Q4SmIPxZT4NVh9eQZ
 n73rOSmyyysMWecz2lYPbt6VMV/NKyMd8eFRzED4942dpACnsJg/n62dJZldcQ8fQXBIbZkDkJa
 SrKQTalWDNhHODrL9L9GKjuvCO5nxPmLRavuaxFyWAb300s5/LxsKDYg=
X-Gm-Gg: AYBFou1ntHB6zGeQmBDpsIFjU8LLeVL8BnSBFWU6KEQpeS+t+oJSaIAvJTsSx5eue0A
 nBAJjDgY7JYMIvT8rlaloSlucBz/4N/cISc3bd5HzvjqCLADf0vCkdjX2kNQNKOGNNUPA+gLMQt
 qeJWIrVMwJSqa+x96r+QxGrjl7SqwyC/lBuO3jNdiYYumrqHpXuS8b0Pa/wmzazutsR9AyOg1kX
 N8RywcArZMs5bPHF9xzZliYth25ogn3d5N9lQEzcM0xfdKevdIkDegpy/JJrXg5sByeUJ+bIQzM
 vRqzqPo0wXlVsiz//d3j+oDTx/LYe7UjLAD5qJIZFLKXWtkwyt4hTxKQzVICDBi+CDAEDKslobZ
 CvP0xYAQ+rvrjYSOEIb6s0P+hhPY9fIseYqWv6gjd7uIg7tR1EcpWzEzpAFI2G4wn3C1hMoEccy
 mi9f1zkVA=
X-Received: by 2002:a05:620a:1a1f:b0:949:6dc5:2a80 with SMTP id
 af79cd13be357-9496dc55690mr1215132685a.55.1794870050494; 
 Mon, 16 Nov 2026 15:00:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:949:6dc5:2a80 with SMTP id
 af79cd13be357-9496dc55690mr1215125785a.55.1794870049990; 
 Mon, 16 Nov 2026 15:00:49 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223a29sm25224549f8f.8.2026.11.16.15.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 15:00:48 -0800 (PST)
Message-ID: <b9ac4b40-6457-4de4-b362-fef53be58cd5@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 00:00:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 devel@lists.libvirt.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
 <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
 <CAFEAcA8La+8TqFY0yCxRsXY2Ad9MA5Uu-sVEbysExZPkUXVawg@mail.gmail.com>
 <ccfcea11-ada8-4753-a71f-f59ed1bcb067@oss.qualcomm.com>
 <CAFEAcA9FE_dTUo5s2g7DMw9-ZhbjBUOfF0RJxdT7gMwm-rYuGQ@mail.gmail.com>
 <558f35d3-5a10-4652-8af4-4a88f382ca3d@oss.qualcomm.com>
 <CAFEAcA_gBzv7URWJNjXwjUbKOJuRQ=bd1NS9enpU_AW_tCZzvg@mail.gmail.com>
 <b0633aca-736d-479e-b6fd-743f5ef23035@oss.qualcomm.com>
 <f8113426-968f-4e96-bf1f-f80f2de6642a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <f8113426-968f-4e96-bf1f-f80f2de6642a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX3H0Ojbdv0ijk
 Ols25trl1VMmxuTWOw9Cpaz4Ohc44HjedkpOmguWHs5GTlK9HPU9cyXckAkgFNn9ycpyzCqkgwi
 gHaqIA6Lwmu0bMrALuvVVdGt45WO6uw=
X-Proofpoint-GUID: 6nzmzrGa-yv3EQaxOJPNpeUBZJbNe1GQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX/ue6jxlwj3EK
 UaCj28mCaZNKkXANTK0JCHUnTpLUea/2jGM9gkv7hIQkK1HT5iAoyaOpYqDz+HTT/xXBJCJSe5K
 y/3iRxgs3QcDcJHRgbn6ABR+OzLOzc1m/hFwtJ9mTk1p7WyfXx3j1NzMnHL2p8rP10z+C5bqk3+
 b+sAssHMCxpntvQD7vj9bOSFkiSZuUqme53pL+GlN86COer63GG6ke5fg94aY4w4Q4kagPpHwn4
 SLn+FEnztzaPh+fC5KRm4r862XVinFYX0/7yHAQPEvWonRW6e5580dXC2n6HTAV5c5heAVZQdyx
 4w2D2UXtRX7MAuMmYE+JmMO1rW+mFLlXI8V3fIzGmG+Vur3Q1MUyF02dDQxe4caJZ/oZXvhY4hE
 Oacpqjv+VhcQ+lJnylw4q0X5fOzjPcAN9n9bPtn7sh5IwzF8Si/u77MuXw8onYG1upOz+QmR4rv
 2gPXcKfzpP6iQBGdGBQ==
X-Proofpoint-ORIG-GUID: 6nzmzrGa-yv3EQaxOJPNpeUBZJbNe1GQ
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afb8b23 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=owE8328HLRaTVjmMRmgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160091
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/26 23:28, Richard Henderson wrote:
> On 11/16/26 09:05, Philippe Mathieu-Daudé wrote:
>> Tangent to this, it makes sense to deprecate quickly enough on
>> QEMU side when a host-related project we use deprecates / removes
>> it; when this is guest related I don't see the urge, in particular
>> when the maintenance is almost zero cost. For the particular
>> aarch64_be I agree what we lacks is coverage testing; but for
>> other features I'd prefer we keep them as long as there is interest
>> within QEMU users, independent of external projects change like
>> the Linux kernel.
> 
> There have been a couple of attempts at aarch64_be, but *never* any 
> upstream traction.  qemu-linux-user is about emulating Linux -- you 
> can't divorce these two.
> 
> In my opinion, those that want to work on aarch64_be can work in system 
> mode, where the endian switching bits work as required by the architecture.

OK I'm happy dropping Aarch64_be. Patches 7-10 are still common to all
targets and worth review comments :)

