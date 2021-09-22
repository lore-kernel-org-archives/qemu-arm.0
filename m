Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3633250lfp;
        Tue, 21 Sep 2021 20:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzusKV9dCt3c971Dt2JeIGAU10jrqP/+9l3pq6Zei0RMOlNNK1MhH5Xf2ZdmPgVKoWcjNsJ
X-Received: by 2002:a67:c81c:: with SMTP id u28mr23806518vsk.36.1632280633103;
        Tue, 21 Sep 2021 20:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632280633; cv=none;
        d=google.com; s=arc-20160816;
        b=LWqPwSVoaSGNbWwAvSu63Vxv/gZ4FnBUi8iQsJ1XRQ/YZh1J9QRzuJ8pgIU2mhQF4L
         P/7pmE50wCy7Efp1n813Pc234kIvQogDTjXTH4nA2/DB4S6DlhO5kIsKcxqB6jvkTD4T
         WJQ2s8NHXmWpe9SpcCYSsVi1nTVKn8xlRHjbJk3GU7+FACuulTu0hAyrTP0mLOdb9mMS
         +uPhduirMnr9Tq6LY6v94c+XZRA86o/zvkCLbMNIg88FXQvXIBu9/EC8Z5O1ULTLlBjX
         M7E09KlsTvxGDhkwbFaqyrb9nAGHSlrCialR0gQ0Rh46+B0HjZ7y9W25gcqrJeA1BO0Z
         rmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RGW9CjSKEUyyF5IUt7W/XeYivBwRG5g5CLWl5dlB+2g=;
        b=s90/w+jzVgvqyIW50GX0JEXy1REHO3ydXoWVUu2IfOWMsJn4hxvLw/ZtgV6+OJQem4
         NZhWdROtPWu/PA+Be+6XaiRnYcSRmoe5KfYzkdiViV31jZexrCkkCnyGOo9KQhZSQgk9
         thUvxUWC5APyL+u+mBwbg2BpZGFbkc5ixsMaAlJIxmO4M7M0yjQFrYvCRfTYN5cNJgTf
         Fm4ujJX/EMQudp0oI7wUqTlucm7CZlxGV9bBh5hhZbyIJ7XtoO9oXgCe6wQI6Ub7Psjt
         WF+SSBv7F/lakxP94kQY4/TDG9q8AwmMrdyXFStDNmR/MlC6/Vq51gBprE0Plq0IcY9i
         uOzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOH9DTFp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si1029649vsh.7.2021.09.21.20.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 20:17:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOH9DTFp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSsky-0002ZJ-Eo
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 23:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSski-0002YP-Pe
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:16:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSskg-0004ue-Tj
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 23:16:56 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so3487230pjc.3
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 20:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RGW9CjSKEUyyF5IUt7W/XeYivBwRG5g5CLWl5dlB+2g=;
 b=dOH9DTFpZh3ULC2Wbf7HLLP16zHaRxHN6y9DMCyM5gZgW/QNgpLatWdy1fGoTBb0G3
 hh2Fd9I2Dn7EkTbVxUZxOzMVUYzis9G46Ph8tvcDWzGCB6BrGAujko+Ga79LR74+StGm
 MlANd+wWmY4LzAhUEGADuUgF9ECtlZLib5Zk9rbAJzEUKoGZIBG5/FMFxUz7DZziEjyK
 W6VjYtYJKH5ENW/ydHI66Xk6eR5i30IIHgvHBUkf0VHmC2n8IQO1shghKCbtjVoVWIK3
 Nh/6rz1/2EhK9cCj1OkOh9Gj8K8dz1D8bRpSRF8rD/xtmejivw60W4OZ8Ed/x3OGJSDm
 896w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RGW9CjSKEUyyF5IUt7W/XeYivBwRG5g5CLWl5dlB+2g=;
 b=v8ZabLJ7WgoIekYyTgzKIccAZFMJ4KjgDMi9WJcn9WarvhRp2dsNfh585itdQ9I0B5
 OJ8Jf69SqJWe3OCKTpsGk1d88nGJxM/cgCOdZTfjzqugrsW5aBQvyuPP46MTslCrH+4a
 PNFV20hrzy5dpGxYpQMERE0nmENQYVlTZFAUi4bb9Kyxl+Yp9OiLnr74p57pZHZuDJ2D
 MeLx4L+h/Bj/GnHElWurc1JJaC0RdS6dv5G6c0t09iLHfVVKTQH0Wxh6BXB7axBQIcGd
 SbjkQ9HTzHr2oiPHrxMe6AOyJ92nQYjw6Agg8MTFhi2+1A4dNrOjVQZp5bik2UIBju6x
 GJ6Q==
X-Gm-Message-State: AOAM532OsyZwpVrlRLYIHSnRKz0NAlzBWjtTJu+CAFcKDGjJHS8GNPaz
 i7rUXDwmE5sRoP16hd/TRpJqsw==
X-Received: by 2002:a17:903:22c7:b0:13c:855a:3d74 with SMTP id
 y7-20020a17090322c700b0013c855a3d74mr30697485plg.74.1632280612941; 
 Tue, 21 Sep 2021 20:16:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j7sm473198pfh.168.2021.09.21.20.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:16:52 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/arm: Fix coding style issues in gdbstub code
 in helper.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <007e592e-07dd-cb68-f9cd-f0c9d3791f8a@linaro.org>
Date: Tue, 21 Sep 2021 20:16:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PK6i6jFAgsek

On 9/21/21 9:28 AM, Peter Maydell wrote:
> We're going to move this code to a different file; fix the coding
> style first so checkpatch doesn't complain.  This includes deleting
> the spurious 'break' statements after returns in the
> vfp_gdb_get_reg() function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
