Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76618CA5FFC
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:24:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkY9-0003OZ-CL; Mon, 05 Oct 2026 11:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xDkY7-0003OJ-GJ
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:24:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xDkY3-0000Vf-OX
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:24:17 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695EPjaK1815700
 for <qemu-arm@nongnu.org>; Mon, 5 Oct 2026 15:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qzGr48K7MjfnZAzro8Ym+//QfGh+33gwHmclTctQEn4=; b=fxURN6hCPVloXdFS
 9qFWwR/UlHg2B72HbEUoRDxCGkk7VolAidZ9Pz3xIZUb3DO3vFupAINgCN5H1bB3
 hMbTqyklcmZgE+6IQysELxREwEw4hdl/VRZXjZs3MUzMyVMZzhOm9Ez9O7kf+u3/
 kLN9YHRWahu5EFN8PsvVVJQ9COT8t0SEQ+qgn8tZ2OCQhBL5GNPBAqFkPpFwxIfH
 Z3O/XPHbsep5B/IQvHRuQ/rdv1GXyA+hlqh1Fhcvc7eu95ZI4ilrwiuDK9SWaW49
 Uq34WlLDfBuq/AB8cPxynywtSnVN6c6YZYTbYKrhm3Bogp6Ui11SNWWv6jhGgF3G
 YVtKVQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7ds1fd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 15:24:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-34d49d8dee1so3161423eec.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791213851; x=1791818651; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qzGr48K7MjfnZAzro8Ym+//QfGh+33gwHmclTctQEn4=;
 b=aPc1u5CWMndJBw1PG/XG/Ea+6pJMmruBWMNIwTlOpx+w/0YeVqI/7e5I8IriZaNWhT
 imX8ucaGluEV+iXbDYEPdAsi9u4pHCoKpvRbWu/4vKG++aEU/8f5B3lLQzYmnE0BOvJO
 +aMWM+W8uTSoKtqF7E9u/rZHZjG9PfoYnEC6Jq8sS5dqo7rYPhLMCuLHd7DiuKivcP/G
 AAjgPy+25FeBs0tusg/xF9XBOPTMWn3CEWouRmTYomvjsSyQKhkMsV7+TcWjZh+kn7zW
 dLC7M7C76avqBhSkHOfWn+TMkhRHMCrwDWV3UzaHo9IQggIskUGnhZx3Do4sL/qBzuYl
 hdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791213851; x=1791818651;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qzGr48K7MjfnZAzro8Ym+//QfGh+33gwHmclTctQEn4=;
 b=WrifK3zgA32u3DadtXp2nK2R/fIGfov9qcL3w4Nig1cYIOdhFpacgcw1edj7b/Ik9Y
 IM2Z3B+6IArnqRmd9z4I3G++eMomG1w03503MFGdSO9XIeQCj6ViFVikzWpCUSiXLuxV
 7tTyR+eSZWBomCnl3KnEw6nEkBrcSCx3ncqGYBpr3dyZWy8LUyF4qGCnPRvDmUdMTSCV
 1CFlAqOZ8VXLzY0r9erFoxlRWv7W6EA8nXzoWUcbSe8PalWAFYgGftFkElZ6dZLdNC8q
 MDR6OYagFn7Y9X20xKLlMw0E+6COt7z8Yd+56O0dzRtQhCWdQ4ujM2cCsgOykFyXngnI
 5LIA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwR4fv53xzb23EMKgDU/3luLn/xoh+M16FlwUF81q+i6smaQ9no2BY1obO1LGbumtTwRSu4NH4QfQ==@nongnu.org
X-Gm-Message-State: AFuF++milRJrNgNjg7TH2XiAbU1tR7zisddtwSTGsgrsE8PXpYgusRou
 wn4YG4DKzYsQSBU3jmA5i8YEbBZ6Uy8Bv1sTKSiQ6VmjDex6Df8uS2BnLXsqFRi6j9nClXYX2CG
 Xjsdi6UO3xxAWUhwQVam2MVKKXdrIgU6mS9N4ulV9lQ4CRyGL80fFmKM=
X-Gm-Gg: AYBFou39oxdhoeEyj0qvQSmaBhegqtxJw6sQZ+1mFygb3yCp7+dKmRYamZdbAsThuza
 eFsCzMiZy8cspd0iB6nx/FRvdrejwUWusOmCFRehsEy9XmbtJVnFs8qONkmrgKBosbLcDFB7flv
 hq7kqYbtSzBVWf1421UUh9rbEHU8gkHgxrtfpxCSEH1577i3UCDRUT04W6zQsFGErS9+Gmye0fY
 nZA+ytCjPnQnYfl55wvLcWuwiaLuVRXNJWaH9o8GoW4SeLrIJKNq0f4TBZ4Htyq4R1gscRvMbSL
 ZyMPTaFhMpH4Vf/rBbV2LO+bFL5+83ZMq9yFZt2K3ZDmqNDOW1efFvYxaUz41Y16pWNrqIGj2z+
 9jhuGiTE53y56P4OFB7RytoGy+hctByD1wJ67W6AbkpVzeKU2P2CatUfQ1VUFY4K8N/zOxw==
X-Received: by 2002:a05:701b:428a:20b0:14a:d8fe:33a4 with SMTP id
 a92af1059eb24-14f5c5e7cb6mr13516812c88.38.1791213851389; 
 Mon, 05 Oct 2026 08:24:11 -0700 (PDT)
X-Received: by 2002:a05:701b:428a:20b0:14a:d8fe:33a4 with SMTP id
 a92af1059eb24-14f5c5e7cb6mr13516759c88.38.1791213850521; 
 Mon, 05 Oct 2026 08:24:10 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-151fcec9a95sm24795087c88.15.2026.10.05.08.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 08:24:09 -0700 (PDT)
Message-ID: <f125ccc3-fc5a-44ce-b32d-a6dfa3f04506@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 08:24:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/tcg/i386: Build test-i386-opt-shr
To: Dominic P <gcc@gcc.dp11.uk>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
 <20260930185124.3036980-4-gcc@gcc.dp11.uk>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930185124.3036980-4-gcc@gcc.dp11.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX8I3Pw5FERK+O
 LyD2Fs0wvQ1C4YwLEEdNJByKN6AQA7o0/LrmcQKNVV62Ii56YHR2ug6d6RoiFvXE/fYgFGFAX2c
 /+QFThAPXBz8YpNfTJOKw36+LHEPk/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MCBTYWx0ZWRfX5Tojvde36Clc
 PEg9Kj4LncZ/62CyyMKsVSfYHltNfiLW6fv0ymyHU9a1KuXgYLAVC0H8HmcBUUww7JtAM8O+oys
 tI92D8E80+jlNrnJO2lKLvFoGfO5qVIi/PKUwMqyEyE1gN/vt0H+kCxJorsCojFKyvN7VHwAlIM
 MXXsPPStVU/Y/5yMkK76r/OQUiQxMgnr1ah+Gfh/qZF5x0fddx9T69DGBDWhua275DZAuQEDjY9
 /rZVtlRooXte7mSA5TcqVyB8iGHbMhD91MTHlWUzLyreXoc7WZImZwGTOGWAdif5/3g3A2YYWNS
 kDIzFFNMzevngA2auHoo73zhZSDQkwdYzGH4AT+AZ8qAEHVKHAmlIiPzD2mbLnL2yNUef+3S/TX
 Gxe0S5anugI5LJ9LGHKT+s6W8sn4X+oiAzX/XOhK7OSHSdgOiZ3VvJeWMnZk8y7ctErREdXWE67
 0y4e310B7SMVBYgbi+g==
X-Proofpoint-GUID: rilmX-4UmVM3_LtWbUnMT5TiOSpJZgfG
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac3c11c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=CP7RdrZA_qBg88vvjUMA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: rilmX-4UmVM3_LtWbUnMT5TiOSpJZgfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050060
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

On 9/30/2026 11:51 AM, Dominic P wrote:
> The old Makefile.target built every tests/tcg/i386/*.c.  The meson
> conversion lists the tests explicitly and missed test-i386-opt-shr.c,
> which 5fe51606146 had added in the meantime, so it is no longer built.
> 
> Fixes: b4e3e90d61 ("tests/tcg/i386: user tests")
> Assisted-by: Claude Opus 5 (Anthropic)
> Signed-off-by: Dominic P <gcc@gcc.dp11.uk>
> ---
>  tests/tcg/i386/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/tcg/i386/meson.build b/tests/tcg/i386/meson.build
> index 4152371a3f..26bd85c05e 100644
> --- a/tests/tcg/i386/meson.build
> +++ b/tests/tcg/i386/meson.build
> @@ -28,6 +28,7 @@ tests += {
>    'test-i386-fxtract.c': {},
>    'test-i386-fyl2x.c': {},
>    'test-i386-fyl2xp1.c': {},
> +  'test-i386-opt-shr.c': {},
>    'test-i386-opt-rol.c': {},
>    'test-i386-pcmpistri.c': {'cflags': ['-msse4.2']},
>    'test-i386-pseudo-denormal.c': {},

This specific patch was merged into master
(2a0ac9c8ac2d303ca515dc819043409aef18cab5).
Thank you for your contribution!

Regards,
Pierrick

