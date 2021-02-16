Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6052565lfc;
        Mon, 15 Feb 2021 16:46:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY3amN7l84ZmAXzx9dR7PGFVeT90Pa5fuKUY67AocTmbOWooCIwDX64ZMTNxXH238h+Y2c
X-Received: by 2002:a25:e08b:: with SMTP id x133mr17083185ybg.138.1613436384055;
        Mon, 15 Feb 2021 16:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613436384; cv=none;
        d=google.com; s=arc-20160816;
        b=DYJzSxLHNviCixDgimGl1LDte6wIi1V0oDTv78LwEcvelkLbi7+7+8ozOQrjr1PVz1
         6wCc9DyNIxJ3+NLh63WAd8MqUqHEn+PmhWeufncQANCcZ4XCFUanE/2IWVakW+nu0CUb
         kjhboEOYxg8ActFWE0KGlwWARvDVQbwFzOwI7eBaOnBKWmFueCsPNtdmq1c//c6hVYKe
         UlGZJo/kHlNYcFauNLCa7V3qHPBZSmW3aLQUBwSJCNTBa9jap2hU8CDCwSOZYYWG2kCS
         wkogak/7fp+RBLwlBJG7KPrtr6jjeGH1FsBntzzmJ31rSdL4Jhvu+lt2FcR6L00XnfQy
         1reA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MsbgF87+Din+0JOLk/SX90VFUqvr2HfqdUj8sasraoI=;
        b=Dxl9RVKO4h+RU7b249BunOLGl0BckQS+ukFMhjO487P84mmViWlwW95V+1zQYKAp5o
         E/y8Dz30KktxztmhmGBJxuQmOHkfrA04jMxSEg2qZP/v8Emorh8y0b8q+meZdCwejb8R
         xvxLfyuH9M5P84pPzbGaz1O9jCOaZrgftP5/4DCRvk00uLveloBYp28y498E8wxIuQxe
         3bBLcxRxvY4mqlz9fbf0wbz2EnS5NHAuvSmTsbWrx8XDXcL/GhJnM7fCE6ww9CuTNQLw
         CvB5XTZsoNOAY3DUaW7P2h/sJFstL62d2LzOXwOAcAeYiSoGiPe5yTt/S1hyiRUg/8hu
         fQ/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BlzdQVEB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si19147331ybg.40.2021.02.15.16.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 16:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BlzdQVEB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBoVT-0004rU-G0
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 19:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBoUz-0004r8-4h
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:45:53 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBoUs-0003Mu-CX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:45:52 -0500
Received: by mail-pj1-x1034.google.com with SMTP id t2so4898629pjq.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 16:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MsbgF87+Din+0JOLk/SX90VFUqvr2HfqdUj8sasraoI=;
 b=BlzdQVEB5CHgpR7sfB3CUWcsu8FXRZTaslLUSTTSJ2UXu9ErzNEQMBD2mdFSFcIWP4
 PS5LLklstu2hsrBGBHOzbfk4F7WJezl8vzh3u1P6RA7QnRS5CTKkNpM3DokDUH80jK8C
 QWdzwyqR0erktjq7GOyK6QG0UeQcp8HXOC98XZw7cyvnwLNk4z2dDl2h2VrGCh8ampVO
 cAq45zs25CElwHF+w4PLEh4enO2NRvWAKoXRXxwN+k+8vFEoK7aEG/TtJ/3Ll9eNzZ7t
 4mgqWnlNk5/JkHBtBVNlyWGKZ8ovj9LRQbW7RGL2a5eDa+wQMBQfzZ7oGuLKuRZG8aRu
 rQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsbgF87+Din+0JOLk/SX90VFUqvr2HfqdUj8sasraoI=;
 b=CLJHplgMht3W0leBH0S0sP6g/s0fS4aJeIUHWHBDZE+ktrI62kxpi85MYE3qCdXzTe
 GcfQSLfXTxYq/d6f2WkU4Elf6z0iXy1oUEzvxYuGIWtFdH9ONj5siC4ZbziRRplE0OcD
 vJTOLqNLSj/vqvwJzgMg05d6YMNQd5sBnsLkLM3CXSNnAabKRZzdZhpGL/YPceQnjhDP
 TG8yh3DzRgliWJi94TMxM2Jqc8Di0YT0tdIuXOXGMyTVy0Qc2zwDLOW6+g+d2sBMOYjg
 kpJ7rG5os49UcsR5nid2KOROj+qsAqzFIcW2KLct1x3VIDtolA6t/BSvz4uSZuTCVUHp
 4+nA==
X-Gm-Message-State: AOAM531yVN2aG1bRjILSBgdzD1Hx2ANWP/DPrrEtnYru5GKg/heoVyB2
 /ifsaGeQXU7qx4obgg4DHUpa0w==
X-Received: by 2002:a17:90b:806:: with SMTP id
 bk6mr1462418pjb.16.1613436344692; 
 Mon, 15 Feb 2021 16:45:44 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q15sm639237pja.22.2021.02.15.16.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:45:44 -0800 (PST)
Subject: Re: [PATCH 0/9] arm: drop dead code for non-32-bit-RGB surfaces
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d6f9419-9389-b2de-8569-78502fec2251@linaro.org>
Date: Mon, 15 Feb 2021 16:45:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TV/z/Tcp1H2S

On 2/15/21 2:32 AM, Peter Maydell wrote:
> Peter Maydell (9):
>   hw/arm/musicpal: Remove dead code for non-32-bit-RGB surfaces
>   hw/display/tc6393xb: Remove dead code for handling non-32bpp surfaces
>   hw/display/tc6393xb: Expand out macros in template header
>   hw/display/tc6393xb: Inline tc6393xb_draw_graphic32() at its callsite
>   hw/display/omap_lcdc: Expand out macros in template header
>   hw/display/omap_lcdc: Drop broken bigendian ifdef
>   hw/display/omap_lcdc: Fix coding style issues in template header
>   hw/display/omap_lcdc: Inline template header into C file
>   hw/display/omap_lcdc: Delete unnecessary macro

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

