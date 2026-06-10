Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EFFCD98CC
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 18:42:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXNsc-0005X4-CV; Wed, 10 Jun 2026 14:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXNsX-0005Vm-HJ
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:42:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wXNsT-00056g-MI
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:42:16 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AFx6FU2082885
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 18:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0dwlJhmiSCmZLkhAecpSpPA7G9RBm/W3Y5aeWg73jsc=; b=JXexkxWDl4UV/8Wd
 L1VipuWlGDlQ582K0qfHkO4tpQ89Uuvmun2ADvVd9Ki5r/42OVRaTs655aM7aDi2
 qvTNJ3gVjvILyHU1d3D0maaX+ShmAZCohcAxzWpkZb2SUNynpF5VAuQe/cgH7ezj
 oFZSjOSVN3rUiXtpetlB7rEylVafHzF7W6m8yWx0V2Y9XRcUFrfPM7Bz0YH0/CDr
 UusDY2lPiq7SdpgkXTzuE2PGrsGWsOFU+Cvo68Xg6NRWUd80PK/UzogxSdhbNHEJ
 Le6/VVbPyobO57q8te5HC0LOQUZtelEUdwiFnO9zAC1rOObWWUxrEBByY+snv/dD
 hVlcCg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnv4yt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 18:42:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304ec73b015so2846757eec.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781116930; x=1781721730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0dwlJhmiSCmZLkhAecpSpPA7G9RBm/W3Y5aeWg73jsc=;
 b=BYK8OnieZPEVfdAnHq0Wx2KTEG+PzdotSZcNrjc4n9eTJ+etVSgRMpNGp9tZ22mnZJ
 likLwwBXhZvhS/fZ5MW5n0RH1fMLwBi65pNpPStTvYCZgiyrumg0c4AUs9RPCEAfSWhl
 RBqo0YlrR/vdn/FfcHmXHWSXP+14BKTql+1HxZO98fQJWtYDlBRVc4ueb75PPiJzxI3x
 s7XX+D+YsZy+tRDQk49V16Gb2SjTNOH1LySkPeAZpnlzsqwjMvWh2AE6ccS3+LbKWEPT
 /auZGo+jihLqncWizihL8jeO8pRUVPLsS8k/lQVzOB8pOjWOgPRdNqyLDfeCwlYDG4TJ
 INhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781116930; x=1781721730;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0dwlJhmiSCmZLkhAecpSpPA7G9RBm/W3Y5aeWg73jsc=;
 b=LHEQN83opU5Ver3EHVpYwQJw7pOujE56XltrMpGijrRYauPAk59VdGmWst8iB3aKfN
 K1FbGcKc4oPQWPnsIgSt5r/BrjWEDCAqY9K762bQPpYpnBwoKvYU4xOE4XcWoKkDVYdZ
 6bi+lsXMzHLqXoklPHOTRLc+hhUfJT3VGgYHtunGCOMavnIwZK6LNxzV0Cf2SnwYcS6v
 Sdcb6oPUPHB+DG7h6TR2pHR/reIU/9700jNvoynqIM8MvSULPTCk6RCB1/4GLB/Vrcgs
 rbMc7O8kmJBX27vBVRR+H13Ffxj2V6FfzT4UKkp8xfi5YY0xOuqRBqMGszeZ8PkLdt3D
 uI5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BBDT1ayu77zaEH1Lr4/YjrbRE//GEq/PZ9sQFUfdKSQfpsRA3OXH178QWOZiPDVPRd1QASSoqNg==@nongnu.org
X-Gm-Message-State: AOJu0YznAv5oTEaNnVp9AudVizVQsCZJOv+gXlexmE3y1hK2b065gMGZ
 yVK5M1gchvpBS2qLLgCZYcPFLz18Q7+mJzJjKgSBZJiW9HvB9qwJr5IE6TGpDDeKbTrjy3NEJCP
 JgcSo51RqayS0xx0LNUpcW/kdTRb+SiAxUKbMDPphO5Al83gJtxsvzvY=
X-Gm-Gg: Acq92OE9WibFFHHztNZVveUtlCu0MxRmkaUkNV4SMR0lIyybT4jNJa35CkqlyDBV7Sy
 8Sx+L3wlyqxtJcApiSd9dbkWMgrmGktH3etdIKhTiQVdV7ulRwJnyODa9RuPLI/JrGw/UxO4zH8
 ztC+Gg2v9EbQPpAMHuhTnzAiIMF1PXl0/EpGnFDyk7vWXXsLD6PPh21Mv6RUhG6hCrT0nTnS5GV
 pgvIy47SGlzksmKatf3aULpBVkfoV8auuZJuwGaJcCjPs2uDJD2MuTTNBetktsPW2mE3Vb8KLmn
 f4Lc0Vq+1csnmlgcTxhCjGvl6lZTE+Bkugqxd1HZUyF7ftMXTtVBaKdbDwF5ulbwraKYV3FpSAu
 ZNACjwor8EHaWsEe8AxLKoMsEwu7bzb05yXivlh0eOMCXDctkFW0TElLdh8dzmCGJQaCJvyIXep
 JuLBvO1dBEasgldppVGWSGyuQs
X-Received: by 2002:a05:7300:8c1b:b0:304:18be:55a5 with SMTP id
 5a478bee46e88-307d62ddc82mr7309748eec.22.1781116930356; 
 Wed, 10 Jun 2026 11:42:10 -0700 (PDT)
X-Received: by 2002:a05:7300:8c1b:b0:304:18be:55a5 with SMTP id
 5a478bee46e88-307d62ddc82mr7309722eec.22.1781116929874; 
 Wed, 10 Jun 2026 11:42:09 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30777ecf9e9sm21519058eec.28.2026.06.10.11.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 11:42:09 -0700 (PDT)
Message-ID: <740bec36-9e2b-4e29-8017-ccd087ef75b0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:42:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/27] tests/tcg/meson.build: add wrapper run_with_input
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud_=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn_=C3=A9_e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-19-pierrick.bouvier@oss.qualcomm.com>
 <tgenhk.1crggx28eg1me@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tgenhk.1crggx28eg1me@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UNh_-dtccSxTqHD0AGKN-oeaLHA536oU
X-Proofpoint-ORIG-GUID: UNh_-dtccSxTqHD0AGKN-oeaLHA536oU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE3NiBTYWx0ZWRfX5XNz/sIuX8f2
 u2mOvqc5+0GpSmDr8XAYXcWMha8JPcnUShdOvxpyKypFzXQj/oC2g/CYfgv3agmtQvvnHGgmtJw
 upp1+W1UocdBlO8HfUMAuzjR1iO5+xYc0qN7TdgfjZn/g29L7hWScdL2IATidvuvA+sIRU8nMwW
 dDCU61+mh6XQUjKfMtHs6BRb4phpIifVxz2MEZyq/BD9YBIF8JgNPTvrBGqFn0TUY4jDHxWb+B4
 ZKI2AvSpudat+cfvR1AXj5rTavdoRtI03q8aBAx4WSvyGCnSmIuvpJLnPGBREYuw1O+kjfipb++
 KDiGDe+9kgpDtdEyEIpNbZPzR/T2gQ+7kJjHrn1ze4JIgHcCClwb11hwgiuhKk2ywk8bZGaKWmx
 dXZ8T/0WKYih8805fzPnm1beP0RqKq6d3iZN8V1Qqyr2pHVTMLPioILE6CCs1AFpf9JsmA1SSkn
 WP62mh3q+rgTRhAuyJg==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29b003 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=qzEvNn_Qf1mMO3kGbkcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100176
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 6/10/2026 12:28 AM, Manos Pitsidianakis wrote:
> On Wed, 10 Jun 2026 00:47, Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>> Semihosting console tests require console interaction, and were flagged
>> as manual because of this. This wrapper automates interaction, by
>> sending a specific string on stdin.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> ---
> 
> Fyi there is also expect(1) https://packages.debian.org/trixie/expect
> but is kind of arcane.
>

An an additional dependency that may or may not be available also.
Also, this kind of interaction is more for functional test.
The goal here was just to automate a single test.

