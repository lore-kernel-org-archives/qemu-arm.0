Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB53FFD9E29
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 01:52:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvn1Q-0002Co-HM; Thu, 26 Feb 2026 20:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vvmt7-0001GD-ND
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 20:43:29 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jithu.joseph@oss.qualcomm.com>)
 id 1vvmt5-0003Ax-Rf
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 20:43:29 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QMaZ8B1938051
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 01:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4eOb+8kjIuwO79HIMv+x7vpCp6MwOYGIJc9iILiB55c=; b=FoyNd5jDAFVnq3YT
 dmRci+h8MqO6Nk4N9nNf8sn8nedP5T4HMsBxJwgEsboS52ZMfwrM/sU7TxzCW50H
 96L7uS2RNaSRFA6WbBkIX9WRXcrYcpsPAMq3viWiUQlemv8Zeq7XZ+oKpA3gqij3
 j9WVqI0Twb3ydkO41JeM27qMXBmauQQ9vB+t5cHJMHRG4s8B05sO5sLPBbNWy3ly
 BToM0whsVhTwtt6zfFp8vitH+rx7i54LOXNZkEjZdBSgkVkIDpSes82JPgkWvuiJ
 ZzmSmS5m+RDuvDajS93lh2I1hEP9vMHQLi2v/IO/eBi2EbShLxigQx8yqPkSbZMG
 p9FENg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw238uux-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 01:43:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2bdd4ce8dc3so22350143eec.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 17:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772156603; x=1772761403; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4eOb+8kjIuwO79HIMv+x7vpCp6MwOYGIJc9iILiB55c=;
 b=Sk0HOO4GaCGu2HsanU9xtt3qzBij+3JdToP3L4hcXArs6HYt38mz3nNWpKhUFjDwzh
 lZBUtwunDwZQykHU4Tkj47qRy1T5H2g/l88bX/H5wJ3EgwQdnJajp9LwPWIIM54eoRNN
 VXjR8OivsdFqw722uWiRhRo94T+lXKamPgTUK8Bo9ov3dv7WSeBKv93XOynmjsM8Z5rA
 ZIW+gOQYtM4vzTWxQO06DFmtU/U3XgKnbFH3sfbQdwmB7qXbsqgQwXOMlgNqjwatAWQs
 YuVSnRbY2fxvd6MQ/3DDzPpbNOfsGDBrjj04L2tU2kMR1tyli3tb4vb9XScCR/jASKZr
 4iLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772156603; x=1772761403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4eOb+8kjIuwO79HIMv+x7vpCp6MwOYGIJc9iILiB55c=;
 b=ZotHk4CoC19F0XxFJn4pDU0/ARw4G6F6rfh+1K33no6CenQjvdI4/rLW5V7sxlfg+C
 G4d0kw/wv7r2q/9+0jyYz1NwwrNqHDbQNAHRpnEV5iRfrgddjj6sqzIUPC0EPRuq1KX6
 yD73UWp8nEwa0T7mMzkVoHQzUNsJ2f3nVv2WrG2bfgtY5os+1qAU9aNauEe9i19mZLgO
 s0ASSC5KysORuNI4F3oy+MD3HwXN35dQEcuPbKz3b1TbCmx/sz1e5Op+myLYrSvv6ulO
 6INB2GAX4z+bYmd7HW/norBBcpisavd0Sce0xww9FLVRGMq+vAW4pFz75CFCXktwzNSQ
 j9Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKcjxSQqV6NNcMANlshG/yQ62EDna85GmEfnPuKXc67d3ZlVDWVCYYESxvPJ+BNZH0KlBXTWVuOQ==@nongnu.org
X-Gm-Message-State: AOJu0YxL+1DO5hCVa8ahFSrWRdzMCnCBu16MGXfFOJajKYUFfdKjsGb1
 VlsDH5IFJfTgnSereLfexc8OBWTmI+sekwvsIp5iJdfn4U9IC/bz8PZBtwRe8QJ46CKLDlYPiC0
 hcDVkIvZqt5MSddumDtisPVlUmy82CwqMvae4Y4cKPaIcuFLoSJXfUDc=
X-Gm-Gg: ATEYQzzthL4LjlzU5OaP2njpEmUPqOL331ZSXXY+hJmbNzOLTSl5twctALw+uI7AwYI
 U6eiGGbFS9t6VE8uMPeQWAfNAa73KgUbfkOzdPO89u2zXSgBOY3XQIqsKX0IQ/q371T+5POE/O2
 Ycn/zeaP+kKdHel38Ku/5nSyn6GnNppd44I59VyH8P1LWjgQOxDBsTay433WjypXYEvY6ddAkB1
 kH9rjdUG/kHiJcm5Yd6GFTtQS0NJtZjbDJPHd61zK+fMdVijV/qvBUdCAs+FLAFc+FSbGef4bgS
 ohxTPnJNVoRBmcfvwMaTl50o7ULKUqIn5ijdeyjtje86T1xYF6Mphvw0wWopE6fTCFp40SSDN5i
 OSkB9QDZloGdm9xbmhY5WR/Q4Gnh1bU/358PyHkh8+BW5fXvHpW/DZQctj2VXMWb7aBUWBWzn27
 Pi2w==
X-Received: by 2002:a05:7301:6794:b0:2ae:5a13:97d8 with SMTP id
 5a478bee46e88-2bde1cbcbb1mr499952eec.14.1772156602993; 
 Thu, 26 Feb 2026 17:43:22 -0800 (PST)
X-Received: by 2002:a05:7301:6794:b0:2ae:5a13:97d8 with SMTP id
 5a478bee46e88-2bde1cbcbb1mr499929eec.14.1772156602373; 
 Thu, 26 Feb 2026 17:43:22 -0800 (PST)
Received: from [10.110.80.16] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bdd1f23c3csm3392532eec.17.2026.02.26.17.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 17:43:22 -0800 (PST)
Message-ID: <c904f61d-b836-41e2-8032-31ea32324396@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 17:43:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/22] hw/i3c: Add Mock target
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "nabihestefan@google.com" <nabihestefan@google.com>,
 "komlodi@google.com" <komlodi@google.com>, Titus Rwantare
 <titusr@google.com>, Patrick Venture <venture@google.com>
References: <20260225021158.1586584-1-jamin_lin@aspeedtech.com>
 <20260225021158.1586584-19-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
In-Reply-To: <20260225021158.1586584-19-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DFylTRjpZLPeJDKUveq4nHuUX9Sh3AfG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAxMyBTYWx0ZWRfX7UyZRYUj6lGY
 qQExfmUu3cSNHen503kTQIIFVP5MWp3cqCufp21gFDCiZs32OdBKmrhhQK7Ucl8njAtC+Vu7pWB
 rWclr9/pvQMiJ4Qngq6D82ZT+M3RJnbzz0E6gLcmTCsdD7zJ3V7JlgXIvVPSJ2zMIFrzlN+naY7
 jEQ5lq2CpNiwOG/n33qp0BCw0nsr2htJDxGy52LuKCOTV91/nWAlGYCvmMXS4Tr3M4e3onQPB9O
 E4RpivVGE54+tWlC7topNL2Ze43+n1viGtmIj5tFeyWvLW1WRPUToBVxhXpbYdscOl9KWy8ra+B
 YKa8973IjzbeoMpphxTLHI5b/H9Np4n5vXN3tEiDLrxm/0AaVQU8YnSgFN65W1kZVKJnFOoplS2
 aVbRWqKBGkBsWRzW7NfF6Nz3rgU38s+lcgG9f24gbrkrVGg3GYCbTVKcfXXZrYlBdjLQzP3D/DD
 R2zv4NCwkHLvBErAfZw==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a0f6bc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=1XWaLZrsAAAA:8 a=V2NxCb60AAAA:8 a=hhZXlTIoh89BGTulTGoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-ORIG-GUID: DFylTRjpZLPeJDKUveq4nHuUX9Sh3AfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270013
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=jithu.joseph@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.306,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.668, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Feb 2026 20:52:02 -0500
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


Apologies for chiming in this late ... I only got a chance to test this last week
This really is a minor comment ... can be addressed subsequently

On 2/24/2026 6:12 PM, Jamin Lin wrote:
> Adds a simple i3c device to be used for testing in lieu of a real
> device.
> 
> The mock target supports the following features:
> - A buffer that users can read and write to.
> - CCC support for commonly used CCCs when probing devices on an I3C bus.
> - IBI sending upon receiving a user-defined byte.
> 
> Signed-off-by: Joe Komlodi <komlodi@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  include/hw/i3c/mock-i3c-target.h |  52 ++++++
>  hw/i3c/mock-i3c-target.c         | 298 +++++++++++++++++++++++++++++++
>  hw/i3c/Kconfig                   |  10 ++
>  hw/i3c/meson.build               |   1 +
>  hw/i3c/trace-events              |  10 ++
>  5 files changed, 371 insertions(+)
>  create mode 100644 include/hw/i3c/mock-i3c-target.h
>  create mode 100644 hw/i3c/mock-i3c-target.c
> 
> diff --git a/include/hw/i3c/mock-i3c-target.h b/include/hw/i3c/mock-i3c-target.h
> new file mode 100644

...

> +static int mock_i3c_target_tx(I3CTarget *i3c, const uint8_t *data,
> +                              uint32_t num_to_send, uint32_t *num_sent)
> +{
> +    MockI3cTargetState *s = MOCK_I3C_TARGET(i3c);
> +    int ret;
> +    uint32_t to_write;
> +
> +    if (s->cfg.ibi_magic && num_to_send == 1 && s->cfg.ibi_magic == *data) {
> +        mock_i3c_target_ibi_timer_start(s);
> +        return 0;
> +    }
> +
> +    /* Bounds check. */
> +    if (num_to_send + s->p_buf > s->cfg.buf_size) {
> +        to_write = s->cfg.buf_size - s->p_buf;
> +        ret = -1;
> +    } else {
> +        to_write = num_to_send;
> +        ret = 0;
> +    }
> +    for (uint32_t i = 0; i < to_write; i++) {
> +        trace_mock_i3c_target_tx(data[i]);
> +        s->buf[s->p_buf] = data[i];
> +        s->p_buf++;
> +    }


num_sent is never updated prior to return, so the traces (from caller i3c_send) looked a bit confusing

<snip>
mock_i3c_target_tx I3C mock target write 0x12
i3c_send I3C send 0/1 bytes, ack=1   ---------------------> instead of 1/1 bytes
mock_i3c_target_tx I3C mock target write 0x34
i3c_send I3C send 0/1 bytes, ack=1
</snip>

Something like below is needed
+ *num_sent = to_write 
(might also needed in the ibi magic path above)


> +    return ret;
> +}
> +

Thanks
Jithu


