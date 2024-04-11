Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp173802ejv;
        Thu, 11 Apr 2024 13:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUE1CVnWlAL/8dMyjT+hiMgbbn0nFsRBAmK89anVI07MD7GZDekZYrYOFacXC9ntOG/cxPiEXzFl4bh5DJbsxzhy1wpWlXl
X-Google-Smtp-Source: AGHT+IG4JhyvN6Bay3YwXwmZpEbDonMVRHfxnvD2xg45aP4ETZS8sLo3K5K5H7x4oN3uG5vxKbi+
X-Received: by 2002:a05:6902:601:b0:dce:2e9:a637 with SMTP id d1-20020a056902060100b00dce02e9a637mr707035ybt.20.1712868249547;
        Thu, 11 Apr 2024 13:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712868249; cv=none;
        d=google.com; s=arc-20160816;
        b=L3SOUqH+YWLOIJuDOP7mUTEPca0tYcHwi83kZGcfWe1q1qgOYfGrtVRQVJ9Q+T+gXG
         agL1U7Kbgj8f6RWS4042IsAcD2Q1ggl0PT2wWnw7NdJEOad8jEqyo5K6j1ZjGbQcCTBD
         y83KCzsYDVpP7HbgNw0AS6MhQLGLfoe7DoQprSY4y6csh1MO74nlijLJ4MpGCoBFjkH+
         Tk3nr3vYLiIw5qMnY+gTZGUtr95NcgTXkF1IrWAPRa2i7+hz+8QwWEN78SV6sz609RDp
         G+7BpPRPCn7flRSyrnFCiWs7LsY0Y0qAx2sE8goAEu2r83eOePLQxqTlN01w9eSWimQ8
         mO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3R+9PPXbgndEwnQH8HX9TDe924s15k6ehg57WOhAWgs=;
        fh=Vntit4n9d5mwZFuNUXDWpFxkiLMMBK5oEX1HMMxcAxU=;
        b=Q1AxNnri0mQH8ztpAKpTtR8h4qunLdgPx6fwyMm620Cgu4KtxF2rUf8SBqG8VqZvEV
         tkbNCgWdANhQoTNsu+UXeqoi59qj3xklSSoW4qgnHJ/jPEEdl3G7iabtgUQDY8NUI1L1
         i5xwhTXfUmJU1wAbhDxNZyzbvX73lQpWTYzXNNUKHN1umG9IZU5Cfjq7+tCjmtHlTSuM
         1FaIZMRpfKP3PYqwp1B0JO/4vaM66BoA6x248vZttR/HwvzGISwPjdn3CACxH0fGmO0J
         IjhQFjvTpYKGpYYuRS+klBcauRbXAIdquXTQoYJOxkU4v2/BlgfcUDc+4zDrJTWH1A/U
         b0nA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vJ1gX7N/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn6-20020ad44a66000000b0069b4f4024dfsi1577181qvb.171.2024.04.11.13.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 13:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vJ1gX7N/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1Gn-0004aU-W8; Thu, 11 Apr 2024 16:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rv1Gn-0004a0-2r
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:43:41 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rv1Gh-0003hg-6R
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 16:43:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-417f81ef284so628955e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 13:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712868213; x=1713473013; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3R+9PPXbgndEwnQH8HX9TDe924s15k6ehg57WOhAWgs=;
 b=vJ1gX7N/XcQiknOOQswz/TTJ/bkNChvBjKu86gZe+/V7TEi29WbJfJttj+HhYYC52O
 ZI9IGc5kHzomIOjxpgslU0XJ/ERxopyrzzObWFa0jjcXMKt4hy2dfqmyjkhkpB9cH7OM
 LKJDAJy4sSp9BWz18VIFtLQfHkupYqO2DyypWWX3pAv/Y5WGdkNPc3lWGhIE9zOfctYe
 7XyAr3/exZS33yLnk4qQthm6dpYo79w2WsVBsZ2ZIap8+1TZx49ocTcXquUtoi3vi0q2
 4qaMczfpL28YHRTqmdl/okOBi1dbUoYR13aVU261w+LQoPgqAOKU+yvSpr2sarlVzeJh
 hc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712868213; x=1713473013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3R+9PPXbgndEwnQH8HX9TDe924s15k6ehg57WOhAWgs=;
 b=xSlekdu/FU0o6GJs2QpbPfVUz5LTGFtthSpBPxCicGM77C139SlnGw1ZNAMkIgkHrT
 WdZPDoxeMyDbLCUb7wgeNGEClbpMG61tCOPZhkkGnA+dL7G71AzvUv/iCgbFIOpd/9P0
 QkYQrLwOHP9q1J4icDi72xfk8H9nW5Z8lhCE8VEAA3HHD/5sRt8DfNSjyYovxS0suwA8
 Wi2bT9n59H7QxaesLQtgYyxCfX7T3Ylo6ax88sr/M1tED63XkrmxbRwpirBGcSSCw2LK
 M1hrZNX/CpkSIio+J8978bi81eeGxkbc9+d/d6YPPTnnRDpJxi9Iyx5+TYhpMg/tmJ5g
 OfRw==
X-Gm-Message-State: AOJu0Ywm5FRIluA3u1cewPR+PxrzbaP84DpXbX/yXGjG0fupwHd7hsoS
 i0muwe9gfIVpj7iZQGe0Njyq3gbhIeuGMoJ+J31aS9xcfSORd31QEwHd74QJMoM=
X-Received: by 2002:a5d:6583:0:b0:343:7b6b:dcc6 with SMTP id
 q3-20020a5d6583000000b003437b6bdcc6mr447581wru.30.1712868213088; 
 Thu, 11 Apr 2024 13:43:33 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 k5-20020a5d66c5000000b00346406a5c80sm2549238wrw.32.2024.04.11.13.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:43:32 -0700 (PDT)
Message-ID: <19938e9b-ddd0-4dfe-a75f-f4ad0f281a85@linaro.org>
Date: Thu, 11 Apr 2024 22:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] util/hexdump: Replace sprintf() by
 g_string_append_printf()
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20240411101550.99392-1-philmd@linaro.org>
 <20240411101550.99392-10-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240411101550.99392-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Mb9fH4lgD6l7

On 11/4/24 12:15, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
> 
> Replace sprintf() by GString API in order to avoid:
> 
>    [426/1310] Compiling C object libqemuutil.a.p/util_hexdump.c.o
>    util/hexdump.c:35:21: warning: 'sprintf' is deprecated:
>      This function is provided for compatibility reasons only.
>      Due to security concerns inherent in the design of sprintf(3),
>      it is highly recommended that you use snprintf(3) instead.
>      [-Wdeprecated-declarations]
>              line += sprintf(line, " %02x", (unsigned char)buf[b + i]);
>                      ^
>    util/hexdump.c:37:21: warning: 'sprintf' is deprecated:
>              line += sprintf(line, "   ");
>                      ^
>    2 warnings generated.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   util/hexdump.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/util/hexdump.c b/util/hexdump.c
> index b6f70e93bb..2ec1171de3 100644
> --- a/util/hexdump.c
> +++ b/util/hexdump.c
> @@ -19,7 +19,7 @@
>   char *qemu_hexdump_line(const void *bufptr, unsigned offset,
>                           unsigned int len, bool ascii)
>   {
> -    char linebuf[QEMU_HEXDUMP_LINE_BYTES], *line = linebuf;
> +    g_autoptr(GString) gs = g_string_sized_new(QEMU_HEXDUMP_LINE_BYTES);
>       const char *buf = bufptr;
>       int i, c;
>   
> @@ -27,30 +27,29 @@ char *qemu_hexdump_line(const void *bufptr, unsigned offset,
>           len = QEMU_HEXDUMP_LINE_BYTES;
>       }
>   
> -    line += snprintf(line, 6, "%04x:", offset);
> +    g_string_append_printf(gs, "%04x:", offset);
>       for (i = 0; i < QEMU_HEXDUMP_LINE_BYTES; i++) {
>           if ((i % 4) == 0) {
> -            *line++ = ' ';
> +            g_string_append_c(gs, ' ');
>           }
>           if (i < len) {
> -            line += sprintf(line, " %02x", (unsigned char)buf[offset + i]);
> +            g_string_append_printf(gs, " %02x", (unsigned char)buf[offset + i]);

I find using g_string_append_printf() simpler than checking snprintf()
return value, and don't expect this function to be in hot path, but if
preferred I can try to not use the GString API.

>           } else {
> -            line += sprintf(line, "   ");
> +            g_string_append(gs, "   ");
>           }
>       }

