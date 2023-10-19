Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp815245ejb;
        Thu, 19 Oct 2023 14:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH31gvyKobkVxAdUCQTIJ+r+LLK5YDbkAZiayp/PKkvxdUyfjGMhwiHjHqG7Dxnu7xG3eme
X-Received: by 2002:a05:620a:2996:b0:778:9858:9f83 with SMTP id r22-20020a05620a299600b0077898589f83mr15245qkp.31.1697752475149;
        Thu, 19 Oct 2023 14:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697752475; cv=none;
        d=google.com; s=arc-20160816;
        b=Qba8YvTixJ4AsSC+MV6cJZYAg37kp9RMnk7jjsoX+fDPL3+bAlQqy5yP3RGVVcKTq0
         IiIR4LYxkjfTQ1kbksbY1Ff5F+vUg+Q/uxayyfbMAxheNfHbqlRyk3gNl+R5mDm85O+Y
         XxJJscHIM6pOGB0tUjvjFXESlwBPd0xu76mr+YSpvCeYkW+u1EO+31PbhGzSX4GTBkc/
         OaAezliI7g0zstheQmOTLrRapVdekQaddrLmC9cNo6ituYJF33qhnJ8vyMncXR8UQFSI
         jn8DzBA3sk6iVVV/43NY3sku2bzal9J2it9Qbz6Aa+OBs+F1ExFzttk8wvJOz2vDwba5
         P/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=m6uoA/gUdgh2gCfHCUiMY91LkGczWCPUe8MMf7DehIQ=;
        fh=63fuqXWdafnbqVGIWl8IQUGmwh8qKCI6VosO+FSh+Ss=;
        b=BzVZFD/RnfdYgsBnM8LmxrUx6hxbj9alFTI+McN5HcYCW2/zAldG8Ld40dbjXoFk8l
         JNSWI3yxSrKLXRucIUZaC7Ebgo4KFszL9fbalvIw+gFXtbgbLJVAcvsgrBGDwgQG9dpz
         UoTT9eD4fp/nxVucJ5rVqF7sFPPTUsgHIlpqgCVC0Eefzaba9XdGeh31W0hTftU6PUBw
         DXxHd7EOnuGhp/dXxrepb438XKn6rhF3lFyD7msdZNiBenbPyAxCE1jsnLaLNBXk7xef
         qvQHMWgKRvjPUl/kZ8EpQTp/nkJpRwAlmhSxk1RmAx+Y8ZftrgLL5Hhk/3KRG+NNCBt6
         HQFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xznR3Zcc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp36-20020a05620a45a400b00773bb585660si296437qkb.348.2023.10.19.14.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xznR3Zcc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtay9-0005yj-Cr; Thu, 19 Oct 2023 17:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtay7-0005yK-6i
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:54:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtay4-0005kJ-Hi
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:54:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32dbbf3c782so790294f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697752450; x=1698357250; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m6uoA/gUdgh2gCfHCUiMY91LkGczWCPUe8MMf7DehIQ=;
 b=xznR3Zcce9skBsl8PYfY5L1ELoExBeIfTN+ruzQsyPgboSSh1Y9xx6/G4WOccEjx59
 awcHK8n+rtPTKHfwAIkxFvAEWvp9WD3eyO8tEj5y899JLRW9p9sLcdOY8OidRnbTtYu7
 oc3c4sm8UH/9FHGDxmAbwt3k3QDC2guGpDpUzTwgN4CTGDmvWNkB5+Y9KF9WzVcmyqKt
 1Dr8l1Ejq+vlShi9QzhGsPXX+K+ib25t4PFBKuOBl52nDDVJBbhsaSqHZMNyxUiDpEuk
 Z5osgTy0N1GyhSg2BuB/5abpx/8sUOob9tfb+3ysle+93djPwCtUzLg8iFJilw23zubk
 RA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697752450; x=1698357250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m6uoA/gUdgh2gCfHCUiMY91LkGczWCPUe8MMf7DehIQ=;
 b=xAHD49IAs5dbZ0Nya7HqyngXC5F11+MBWv3vQEfV4YfrCocKn6NU2Pvz/4M5HdPB/3
 LL/BQlUOlJLas3TU1qtY5lPKnf61oHAlKvecbjPGF5mWXPi0wlI6+3Y8B7jeVXC2ZeAe
 1f55s46LCQ2cuz601FhNK1ZTrpfSXsY2R8sORV6EVg1UUN8rsxhoOHQEa8lfeiJs12ix
 yi/U6rFSXfuxKQe5dgUcsI+y4pjQbdf1hAt5AXPQhfkl2stlwiV+jBuSjVn96F9L5AI3
 buSIVrBE/JJyv6Lx7Zr/6G5mJGw3u+MqdNFBKCbcjWvLS++wNjlXOlcpuELKZcLvHZX7
 cNnQ==
X-Gm-Message-State: AOJu0YwRvAkZKd/5c725MxtIg+H26HhqljthQEIDmHC9VdjxCwfhuz11
 BE22cEBa5QZ0DF3LKPzjdqGw+Q==
X-Received: by 2002:adf:b346:0:b0:32d:cb21:4e99 with SMTP id
 k6-20020adfb346000000b0032dcb214e99mr2805828wrd.13.1697752450100; 
 Thu, 19 Oct 2023 14:54:10 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d6946000000b0032da4c98ab2sm267171wrw.35.2023.10.19.14.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:54:09 -0700 (PDT)
Message-ID: <85d802ff-bb4b-64bd-cb1b-471264a2f487@linaro.org>
Date: Thu, 19 Oct 2023 23:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 4/7] target/m68k: Use tcg_gen_ext_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
 <20231019182921.1772928-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231019182921.1772928-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: vy4eTAzDYbz6

On 19/10/23 20:29, Richard Henderson wrote:
> We still need to check OS_{BYTE,WORD,LONG},
> because m68k includes floating point in OS_*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

