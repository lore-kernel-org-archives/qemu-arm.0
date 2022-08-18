Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp502454ejf;
        Thu, 18 Aug 2022 11:02:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5O9LTjZI6je/hPGf5xRJmC8tasQbsODiMi7Vlm1lP2JJIULNmcQBQ2N+nPHZJX10Yok8nv
X-Received: by 2002:a37:de11:0:b0:6b9:b0df:df8c with SMTP id h17-20020a37de11000000b006b9b0dfdf8cmr2976489qkj.327.1660845733272;
        Thu, 18 Aug 2022 11:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660845733; cv=none;
        d=google.com; s=arc-20160816;
        b=VEOU79ayWXXnQ/dE9Ia3d0zD1engOS5gRPD2fUjBnt22Yh7wVez/LrDAsVAiL8fhej
         CVuWXaUhdIj7bBBY6e5gwnnhL59DVgVwNUwoQjn3T1onqAeAmglaqcZ/CTDRuq+2WTak
         r0tuJ+TLR5MTkdJwyC6fI0VEab2ZS0FL1xqNa55z8NnEY32PXe/O+HXE1zVwIIJF6vh7
         WzuzSIfINu+/ClQSRs/m1qhunasbCanfFMOfYhxEbAhEemmXdPzc4Xi/at1UooLag40S
         ZakLfQNw5zZGOMgOOd24rPc1IYonirWlBvmxe1J1gFwQNNcIDvTm/VVBrQ4fr1ZCeptn
         snwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uwEBj2vYxvHEh+vOQNh0UOespMFR/S2waDifvnO6DG0=;
        b=krJsxX5KvFwjbXWrEwfUMlNZI05fD9r+6wrzqFEQy75iBDKMHaNpC5yaYcDDgUmvkH
         cNoe/d7J4uYcfk51PzbF82DSf44m7+eeQ21/yevlmMTiukOMEudGwIJyMOUbHXTVQy5P
         yOhRobnOuRHMD8XiHVj5zJSBuL5DTcGGg+FN0/gMpCUNGbtAcF8stTwH42xTYl7PYcPh
         1rDlxrhRBh+/Iow6cMWOs/EOhui/o7J6qSH/165Jp0gfD3Opx4UdeY9GnJSNbMmTwy8a
         chAMlzwt/bCUKqaCZzRErx7lqNwV+D+NBCIJk8gPFJdMSY8SzfojndpluAVWlMwbOrm0
         5jkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f9qS3y3W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020a05620a295000b006bb3e1207besi1551202qkp.758.2022.08.18.11.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Aug 2022 11:02:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f9qS3y3W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOjqO-0005I5-N9
	for alex.bennee@linaro.org; Thu, 18 Aug 2022 14:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOjpx-0005F6-KH
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 14:01:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOjpv-0004ru-Eh
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 14:01:45 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso5477295pjk.0
 for <qemu-arm@nongnu.org>; Thu, 18 Aug 2022 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=uwEBj2vYxvHEh+vOQNh0UOespMFR/S2waDifvnO6DG0=;
 b=f9qS3y3WYNjLLjQIDV3aJ9qYZyEiqySihYIYbH6OagpUwKPrguh5niBBhT+hVrAnzk
 IfGGb8hjF5H4prSRQB2p7AavyaBtzDCIIm7XLLiEwoQwRZRR3Mle5WIQvxkmMwy88uQJ
 I2LjAaUQ6f2RlL+DFUt7I1Sum7ZAUIe8zZWa9/90rxKkISHFJAKjjmd9jITh/RmeJHd8
 DpGJkun+Q7R4Xoy4h9y9da/vcyLj1hgEcHkwg5sKJ7sWUxC/2LVnTLmGAkCPnczR37RH
 +3kjyNMg8DbE0K1PpsI1iYnvKN80/BlE8z5I04BtNRGNBtdgsSPyVII5hzI6/gO8Rtj7
 Od9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uwEBj2vYxvHEh+vOQNh0UOespMFR/S2waDifvnO6DG0=;
 b=eF+BG+Aiftr2peTB8rCeF2nreYWbRzkNiSVsaJmES8IyYCAkjocwBsll1LimiR18Zv
 wdxzAyyl5Nb6ohhpjP3Q9iyiMNAPzdXfx1sH2KSeVqFXhvm4I5AAxzrff3cMX42vm0Lb
 nonHF70Rz4/iBB7+8U+XAgc4D5uYB5UQqMRa4Zcl9ELFv5C6z1kFXoMfKzL+pdIDSeaW
 80mSouvJC5BL8fZHxIYAhEn37o+eS7c/1NbimX9CjrpfRXKzONwzvsYq2GbOw75zZBqB
 uzXBIjVR97514gE17fnlPynlFoKB7EfU/OGgCF0WhIFPgQjvsYhpT8bEPrOmrq9Vte/6
 2nvA==
X-Gm-Message-State: ACgBeo2I1XisGunA3fdp5q3ozpVaznFjweZMrauaFbEtahN/6SKyEY5+
 zcUUaTkOc2PlwftXWxlL5TWf/Q==
X-Received: by 2002:a17:902:db0d:b0:172:925f:3c78 with SMTP id
 m13-20020a170902db0d00b00172925f3c78mr3758781plx.157.1660845701520; 
 Thu, 18 Aug 2022 11:01:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e?
 ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 s185-20020a625ec2000000b0052e82c7d91bsm1917645pfb.135.2022.08.18.11.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 11:01:40 -0700 (PDT)
Message-ID: <566b37a5-757d-7283-12e8-3729a8cdc759@linaro.org>
Date: Thu, 18 Aug 2022 11:01:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] Fixes for QEMU 7.1-rc4
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, David Hildenbrand
 <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-s390x@nongnu.org
References: <20220818065631.324170-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220818065631.324170-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7tewo62+oWGl

On 8/17/22 23:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:
> 
>    Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/fixes-pull-request
> 
> for you to fetch changes up to 88738ea40bee4c2cf9aae05edd2ec87e0cbeaf36:
> 
>    ui/console: fix qemu_console_resize() regression (2022-08-18 10:46:55 +0400)
> 
> ----------------------------------------------------------------
> Some fixes pending on the ML:
> * console regression fix
> * dbus-vmstate error handling fix
> * a build-sys fix

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Marc-André Lureau (2):
>    build-sys: disable vhost-user-gpu if !opengl
>    ui/console: fix qemu_console_resize() regression
> 
> Priyankar Jain (1):
>    dbus-vmstate: Restrict error checks to registered proxies in
>      dbus_get_proxies
> 
>   meson.build             |  2 +-
>   backends/dbus-vmstate.c | 13 +++++++++----
>   ui/console.c            |  6 ++++--
>   3 files changed, 14 insertions(+), 7 deletions(-)
> 

