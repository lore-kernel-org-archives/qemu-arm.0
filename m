Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1030583ejb;
        Mon, 18 Mar 2024 19:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzOcJwYvwdYmsjlsPmnMiNGNx2fWzhWK4L86Sg4ae5DpL7DJKbneliifN914D+9buDQ2kVI02SrvTlCx3oUMD1gAWwuYIl
X-Google-Smtp-Source: AGHT+IENe1N09poOVrC7njIsOL1dJR6Xidgb6HA9k3bc4076FUU4C2Uc7De4ZTTi6bqxP67YkqCC
X-Received: by 2002:a05:620a:5dcb:b0:788:19cc:8a4b with SMTP id xy11-20020a05620a5dcb00b0078819cc8a4bmr15588856qkn.1.1710816897824;
        Mon, 18 Mar 2024 19:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710816897; cv=none;
        d=google.com; s=arc-20160816;
        b=WsBldZqgxEVkbHrU9TtBDrTC3J1Ra/poGqb8L5ny2vJ4mxRgTOruzdrFJTHLW4LRig
         sI5m5BoqlBem2+Iq0NBv9FC7MGbxFcHSKFWbH5xzS7ayclg2+Xj1mCceWBdyuuh8lTAG
         SDhRlp7K41xol3OOqN1E04D8OOO99D/mt/hlOn9hSOAkSeKjd+m+7AE9L47YhZtyOxDb
         F+AazqyF0sJ0yRZ9KK2bWOjhNqVaZICYqkzrt48J1bfMRAw2DaNgEPktYn7AxwPb7/+9
         qNVEVIBrFvWoPprVSHCJcuLhBtJtT3pgDhx3woc3+F3Dy3cSTRHldFdElvU5EBbhTseF
         ngRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HDIBy76UAagNa5qz5F2BQ5rKPIrkH/FBLCwd5Ke3q0E=;
        fh=zi6hZ17F1lczFEAPf/GwbC016OZpuXb1YcXTJyQszoc=;
        b=eTFyC/coK60V6k976wuxa1zILw6dtZSPMi5ZQhxB4mfpgWpQMSa9zVOahbCXofVHiL
         Het7HhgQASXEEjBvukYdw5rktGJIFXC12+5StzdEnWULnEXM4c/bU3aDceYje57Q6V71
         aLdNzRwPtpHpegVS/Uan1rJZ7PjuIsex0Oaa9iqJANfyjc9+J9zzJebhqTVGjmx8Z81R
         4HTsjIb3GfsrXXRAAKMkCYNyNofmVlh6cyHM7YHTPlGm6ZUEfhF98NQBDe08Zfka6CVr
         pN8I1yG7MZrTsGTvIslmGFRUOldTdZKfGJ9jZ0tRP1gx6+tM+N7Eaqqjl3SGMG8m/5g2
         sjhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=adyJWLwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020a05620a29c800b0078a11e5da35si695370qkp.733.2024.03.18.19.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 19:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=adyJWLwO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmPco-00007v-I5; Mon, 18 Mar 2024 22:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rmPcn-00006K-CG
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 22:54:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rmPcl-0004j2-Go
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 22:54:49 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6e6afb754fcso4815148b3a.3
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 19:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1710816885; x=1711421685;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HDIBy76UAagNa5qz5F2BQ5rKPIrkH/FBLCwd5Ke3q0E=;
 b=adyJWLwOeQMppvklVmqVKXTWVYnTV5L7gtdfb7nyzngLet+lGqlAfZltxiccGFDnUE
 eBiAn2/hN5U8JjEDC8PGF/akbXK890w6LfsrvoSKndsgVRoInGJ+zY94yelbmKAPc9TC
 4DH2IWWXc/4G89QjYjabgigMmkfpdf4Ys7KpoRQCchQ59n0rI2VUvum+pcNKn3oVpsIw
 KNDJglhYGpCIDSWnJOfsxljHgTOfZEpOpXMlqUUbWgCkmTQ9cUTVYTRMELJcJAeh9a2s
 j9uguU8ycFjT7/iVE5NaPjZ2+sDplvQ9FQbQQHSS4H4CauilZ6hcNPy6VRxaSrKjOI7e
 S5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710816885; x=1711421685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HDIBy76UAagNa5qz5F2BQ5rKPIrkH/FBLCwd5Ke3q0E=;
 b=dhD9KnXENEuMLPlzFWaQbaePb5vNHDHgILNxjtibhDknKjw2wgJ+I3Ip6SfH+4hVkp
 yyfDVIhJbPBnovhTlLqGDLegnkd1ZOdh7Kvrlr2LjV4yJwad4DizfIQwUhZP8TM7s/Tx
 K0IeqJ8n47fX/r7xbIvqVpu1J7HIgTjG4yf2Zwzh1zeHasSHod7FLzjFmisDfhM0Xhr1
 wlX4aWIwVTX2s7pR2LmxYp1DoJJ4pxjdnxPob+h5L+mlHBYYLxwVmbzfKv917syR9PbY
 4JVi5+xBnJjgqKqMX2J2XRTZjV7MhT48LJQKUF9I724DNFjzQ0WlvA+JATpkPqeelgBG
 lMUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVILpJE8mgK0YbsgZiQemapQ/fPfDeBOiZTw3dJ4Avtz3xJ7UgYWn413s23GkOc5xY/z5mC6PdMjYo4BErJA+wWF7wy
X-Gm-Message-State: AOJu0Yzjez2JYVc4p2V546mhQJoZ7UM6uWPWqU/okjMvhXx1lAtaIepQ
 Ve0gQc4Nm1K7GIA211ABarSttyjx+qZcrUKc6zeBbLxmuvsZCX7rbM//SFDfeic=
X-Received: by 2002:a05:6a00:2301:b0:6e5:64cd:8f52 with SMTP id
 h1-20020a056a00230100b006e564cd8f52mr17768104pfh.0.1710816885591; 
 Mon, 18 Mar 2024 19:54:45 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 z3-20020aa79e43000000b006e6fd17069fsm6188632pfq.37.2024.03.18.19.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 19:54:45 -0700 (PDT)
Message-ID: <e15312de-3a5b-47e2-aaa9-1fb3f623b04f@daynix.com>
Date: Tue, 19 Mar 2024 11:54:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 v2 2/3] hw/display/pxa2xx_lcd: Set rotation angle
 using qemu_console_set_rotate
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20240318113140.88151-1-philmd@linaro.org>
 <20240318113140.88151-3-philmd@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240318113140.88151-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: i7Ft2un3bttJ

On 2024/03/18 20:31, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

> ---
>   hw/display/pxa2xx_lcd.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
> index a9d0d981a0..7d03fa57d0 100644
> --- a/hw/display/pxa2xx_lcd.c
> +++ b/hw/display/pxa2xx_lcd.c
> @@ -1439,6 +1439,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
>       memory_region_add_subregion(sysmem, base, &s->iomem);
>   
>       s->con = graphic_console_init(NULL, 0, &pxa2xx_ops, s);
> +    qemu_console_set_rotate(s->con, graphic_rotate);
>   
>       vmstate_register(NULL, 0, &vmstate_pxa2xx_lcdc, s);
>   
