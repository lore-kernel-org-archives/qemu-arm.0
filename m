Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A650CDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:36:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPdu-0008JO-23; Wed, 24 Jun 2026 11:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPdr-0008I8-Q2
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:35:55 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPdq-0006Ui-90
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:35:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c891d27b10eso705648a12.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782315353; x=1782920153; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IErdKKe94i4/WXP/vZlxmKkutA3Libx137ppXieDfO8=;
 b=a7CCG1rWgLjY+LXqmSkIp4jbURWFEYCZebMpOT7c1HxnGIVvXjsJQrQDj1APG3gFE8
 NGW+uysQMkNROljk+UkzZaO/yRp4BI8q7U+Tj2ukAZEXrUJeJMSFid98EOUrMaYSSqRq
 0eyxhx4i0uktalAIPEO2XZWnon5qY4PkYAKTzsVZC6VPvFSrsv5lZk/jRzRGMGW3LT3u
 HA24GuZmdD5dXguWg4cRLRMmoweYS+l9Bd0euOGHa+mVHgwQdZYH0qUsazv3kECMjnJY
 9Nyu+U5Zrd3HUpNKer1HqYhrh7c6bWJQePrLC2q/xTAl1SR5B6su493G5CrbqZoXiWVP
 Yqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315353; x=1782920153;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IErdKKe94i4/WXP/vZlxmKkutA3Libx137ppXieDfO8=;
 b=ALVvcj5SmlStmYy8co7n4jsjOzEO+2+tShcdbOTyQcvft0vGJvk2cgEh6UzlRRlbXW
 /AqAPZgEvQQEsjfhZ7dRaxsg3ca1NC/hVB4vjRSvKXQ7dDXTyF8Y9yWRlYt7KUupNeM1
 RSjD6vsV9LDQYviRc/LKUpgx88QYOVWTRkbppPKexCaOjCsYTecFz+K7/5vWeD8hGZpS
 79/TTqK2fDccA/S9h0go07o5EkWtXchX/GE4/5KXuX/bZJ/BrLD+d2K9aeVJoYTimKu7
 EdrUUUtVJ7/1Cv4ZucE8dlhTGu8yiyVl9LMliL9VXVwlLIjS747wgEo457dxCy7lcLkQ
 QLEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eQoiuokM428529bZvCrb6QW2EaHQldLLQB6SGO82XntpC+Ubhvj6oR/p0XD+/n4dB1sj/BO0dmg==@nongnu.org
X-Gm-Message-State: AOJu0YzsIn9B8A3LN1QcHoffAzbN/zCtvpjPUD6MpLTSz7L0ri6fl0xl
 DuUBwrhHXhBkrOwlkS3LuW0R+0/0CJlv1QK3Sa2IXxr9zJw/cLlaS7S5CwxgCX2HfcM=
X-Gm-Gg: AfdE7cmdKn6MI+OV9GkN1rFCLtM09OnYqOkAHUxO8xes+mHNhqoQbecCT3O5Gqn8Km4
 IexfjAtL/eEOHumsCr69xCb5xrzYD74GpdZG6s0sTUyBgNXUnGr2ctDO9dSTrwSnWlPbITA+LRR
 o1AVePwG95s3CqdNnd8AY+TmrfiHf2eMA4w1MuK6wmbrZYV5yXHYo0dJnagm7fF34uhMUpto6c7
 cFBtxGeySql7+2kcKQzhoSPAbRx5ND/zRYUnyNeDbwZl+1iYqalbYaKTNsKbHAC4HE6d1txe0Ju
 f8pGf0f5WpVx7PG6T1eNjnX69jXTPg0tSBAObrbv6abzBS1zhLkQu5Pp5xOypbTx3jS8Mxv237h
 cb6loKxOTFD479iqtdTmJwpGkBoJGUVPRy+YGbeOzfXsUkpObPDBGWZbNLPmSdQs4xgDMRp765x
 4f1PK+lYtwKoGCxbmD8MP1WebumocMWxrDNwmki9AWrGdgbjPFCQtOhrnURQ==
X-Received: by 2002:a05:6a00:1acc:b0:842:4612:55f6 with SMTP id
 d2e1a72fcca58-845a2774964mr4804974b3a.21.1782315352628; 
 Wed, 24 Jun 2026 08:35:52 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a411942asm2561976b3a.48.2026.06.24.08.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:35:52 -0700 (PDT)
Message-ID: <97b3325c-9e6d-4d95-b335-aaf705b2de58@linaro.org>
Date: Wed, 24 Jun 2026 08:35:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex Bennee <alex.bennee@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-3-dc6cf8e512b6@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260624-jmac-fprcvt-v2-3-dc6cf8e512b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 6/24/26 06:37, Jim MacArthur wrote:
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   target/arm/tcg/cpu64.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index f7a920a202..f259e82dd3 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1269,6 +1269,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>   
>       t = GET_IDREG(isar, ID_AA64ISAR3);
>       t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
> +    t = FIELD_DP64(t, ID_AA64ISAR3, FPRCVT, 1);   /* FEAT_FPRCVT */
>       SET_IDREG(isar, ID_AA64ISAR3, t);
>   
>       t = GET_IDREG(isar, ID_AA64PFR0);
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

