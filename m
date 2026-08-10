Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F49C5AD7B
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Aug 2026 15:46:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtSCp-0003UG-18; Mon, 10 Aug 2026 11:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtSCl-0003Tg-0l
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 11:46:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtSCh-0007Ir-K2
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 11:46:20 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67AFWNq72344956
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2026 15:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CO8zFgnnGh0Pj3jvIt59mZtF+BW4XfjWuQOvQbaSVUY=; b=H7CaQeu4uczuqHvt
 KGW664dGKHz6GLUezpJlZyraPE/nrMTbvyc2WvLbjvi7FGHYpi+VPIoGYBGQuRbP
 DUMDx8Q0jkb8sI3pX/pr9mEnh9FRjh3PlmxJyqLiGq7cJMbq01xUbnHo6gKPQ4+W
 OP/ryDH7N/6cgY+BliwytzYYM2P0fY8c5Ht/l/QVFneTqJ9xYX56TxvRVE94RytM
 0Od1w0zuyjGsjamcdW25/5hLzUZKHZc34klxbZmZf3sEUexf0Zm2XHSpa4Y3aTLC
 0PeyhMU41YO5b85Q8E1JWyVMppkGrVXdpMR1sKxxRFZ2JKttjYfiLF1q+TiWLOmK
 g1ld2w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xucc8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2026 15:46:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso39642661cf.1
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2026 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786376776; x=1786981576; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CO8zFgnnGh0Pj3jvIt59mZtF+BW4XfjWuQOvQbaSVUY=;
 b=ggaDo6viw/Cx18ValA9nH8W677fHNjCjI/RMiH/9J5MkJ6mctjCloytj7qAaFRgCUn
 zSNNtpT0JtNdQfaS7CtkCM2psJ3/jDGeklX6TEmErIJt0nd+l+3eXxwl78fdvJUP+BsD
 gQuGot/PgNACa3RervQp7yO18/og9r0BH/hqSCVSTSa13egT4djwwxEMqXVAEGErxmAM
 p0IfQKUI2c09W976QU0XLTSIjal2sdP3Wqvr2koagFOsZnMm9bnC9Bw+XtiU/H5vp6Ik
 HAQ/sSnYdG5yvyKC/mVVFlmw3FPBwjM7Ljwj+dY+ijpeSMSS5c+vSRL9e5Fh0lV+YXrq
 6nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786376776; x=1786981576;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CO8zFgnnGh0Pj3jvIt59mZtF+BW4XfjWuQOvQbaSVUY=;
 b=fZ3j8GzT3R5hhbcknnDZPJaGsqGlFmwe5meUN/gxCmk9i0m8uGRJT7Luniph7rXd/7
 eYtogdyxHZf8sJcP02zCAHOQVDUOIjbzD9eWo4nIPrVt6HfCDqQ9ZewgCQEnyA3FTJNB
 VXbimP0GFS2CBK+vLkIfxG2BjTeUoeL6+7EObWrfeZWN7HzLIWebZHJ1KNP8JvpIsIEO
 3NPp6418OgohLGIncU7Z6COndvtJJMTwWbl4Yu8RvGXDDFMrTmYlTSc+yfUZ7nCMQg5H
 o/lxAVKe7UhzBHMut5rN7D3daN/ldV1Pxn5Is8q/OON5uifXwwAI/pk8apXjAssLD5Je
 LX4g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrNQB8wAsmiF/l3MLQdFhLZ7/yQrJ2McfW46WNA4VpRGYAtAadxyUm/YQi1WWrltZHo33Y9Cajorw==@nongnu.org
X-Gm-Message-State: AOJu0Yy78VNAxXGu96jgTEJIInYZZqiliM3K1GiwZk6hpm4stuDHsOJ+
 JXqiWyJCXPmdbONIVdsr5EXkfbBf5B48IJcPEANo6bYWXZ9IFlJNc3bLEzo77fJVBkk/HGIBGeW
 ve+H2SwpvfzsX0MylXUl71WiKOK+TJ2e1kWbcQZ4GfnzFtvlNwBzCWtc=
X-Gm-Gg: AR+sD115IetZd8kTTPJvE+qvi4OhURev0SrV9pySnKUK5n6DGNcubWWl7du8mx7+0Lb
 P6G9DGrpB0VFryRRdo0bn153N5Qgzt88OulguLOwYIDhArsQoeUbWLNqamRdsN53AI6lV97DdEa
 5iQegpFItTctC6VPdnzLPyo2UUuMRTr0acfsfMJoN/9KQeH7sGOOEf9q/Oa6cF147rEqrsnLDlc
 x1BOdQZpR6AZVo5gs+Cs7dk/UFe0CnIraAp4HMeZQKVvJ7z6POsaORENDsOvJWm5qybEei++9LR
 0o+2Yr856lT0T1FGJ/0Ocdh9cOCYgPTTwcENL7wOqZ/b5vCaFWSis8GxNaKws3IqvoB73PP2Nm4
 Zg7reCDsua3rhBtzOeoejHAE2QqPR65BZBek=
X-Received: by 2002:ac8:58c2:0:b0:51c:9ab2:dfd2 with SMTP id
 d75a77b69052e-52d4bc9da8emr29696601cf.33.1786376776448; 
 Mon, 10 Aug 2026 08:46:16 -0700 (PDT)
X-Received: by 2002:ac8:58c2:0:b0:51c:9ab2:dfd2 with SMTP id
 d75a77b69052e-52d4bc9da8emr29696171cf.33.1786376776042; 
 Mon, 10 Aug 2026 08:46:16 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021506cbsm37729323f8f.14.2026.08.10.08.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 08:46:15 -0700 (PDT)
Message-ID: <618cb7da-3065-4527-9a18-f9ba435a1634@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] char-fe: implement qemu_chr_fe_backend_name
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, zhenwei pi
 <zhenwei.pi@linux.dev>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
References: <20260810153503.2652324-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260810153503.2652324-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNiBTYWx0ZWRfXzj2onc4gPRd0
 HEY2hs2YQ34jbjOV/muKd7Fj5XcrNir9/xiUZ/ZkKx+YwZHrrIfH6HQC1Ha9gD6DKcedSNS8OX3
 Y+4wpVsZ/4nhKaKlsXxIAD/TDgHSpZE=
X-Proofpoint-ORIG-GUID: 5owM9zvQ9HB5AhCjqaKIhVfTRiBZuYQD
X-Proofpoint-GUID: 5owM9zvQ9HB5AhCjqaKIhVfTRiBZuYQD
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79f249 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=yxC6HurKH7sghgkbwbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNiBTYWx0ZWRfX4KeeXFIOl5/Z
 72YLRqYV/B2338oIKAozzSfvCMHSc5jDnnbN4KBVztvEzMdq+hhOmaZKLF+jf1hc/1aDHQ5DTXB
 JvoUkHBaSKR00zf4DCi6jh9C/ROQsNGzNDr6hVo/IOuMkQsQ1RY4nXPZacUVnHzuVsQ2OnASNev
 2lnXd0f3XINuejmC2yQVMMQ7o1h0RjEX/SXxeF/t5KS7kocLR8hEAGC72mO9AJ8Vgwwc5iQ8a8o
 k19tPD1oiLS8Dh+NdxAmAOx+G+xRsDnbZDkfx0IcMgwOGJ/jECitUmR03wUKFzZgeiCm5YXNH/I
 aodALRIjEDgYsCXznsST0dbd/6RSq2MttSjzz071RTh3begDiAY1ThA6RztBMe/JtNx2HoeL2we
 2FpZ/0dNL3OpKc+Zz4BQZ+SGNiX1GPpIVvWPzj4Bivi3q5r1dBhXeoUpD6rK1doRSxLhZ+qEIAS
 YT6RRXu5STgGzxUW1cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100136
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

On 10/8/26 17:35, Alex BennÃ©e wrote:
> A number of chardev users where calling qemu_chr_fe_get_driver() which
> is discouraged as it blocks backend hotswap. As the pattern is common
> and need for the string is transitory add a helper and keep
> qemu_chr_fe_get_driver() for those that really need the funkiness of
> poking around the backend setup.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/chardev/char-fe.h       | 13 ++++++++++++-
>   backends/cryptodev-vhost-user.c |  8 +-------
>   backends/rng-egd.c              |  8 +-------
>   backends/vhost-user.c           |  8 +-------
>   hw/char/imx_serial.c            |  4 ++--
>   5 files changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> index 5f8a6df17dc..13218d04c8d 100644
> --- a/include/chardev/char-fe.h
> +++ b/include/chardev/char-fe.h
> @@ -52,7 +52,8 @@ void qemu_chr_fe_deinit(CharFrontend *c, bool del);
>    * associated Chardev.
>    * Note: avoid this function as the driver should never be accessed directly,
>    *       especially by the frontends that support chardevice hotswap.
> - *       Consider qemu_chr_fe_backend_connected() to check for driver existence
> + *       Consider qemu_chr_fe_backend_connected() to check for driver
> + *       existence or qemu_chr_fe_backend_name() if you need the name.
>    */
>   Chardev *qemu_chr_fe_get_driver(CharFrontend *c);
>   
> @@ -70,6 +71,16 @@ bool qemu_chr_fe_backend_connected(CharFrontend *c);
>    */
>   bool qemu_chr_fe_backend_open(CharFrontend *c);
>   
> +/**
> +  * qemu_chr_fe_backend_name:
> +  *
> +  * Returns: caller freeable string or NULL
> +  */
> +static inline char * qemu_chr_fe_backend_name(CharFrontend *c)
> +{
> +    return (c->chr && c->chr->label) ? g_strdup(c->chr->label) : NULL;
> +}

This looks like a safe setter for the "chardev" ObjectProperty.
Maybe we could go one step further and unify adding a
object_class_property_add_chardev() helper?


