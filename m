Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1099622eje;
        Mon, 10 Jul 2023 04:11:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE8cr7IyxYO15eCLlcaFaMqkSfflWRl48Z8mz8H6IvuIM0pRMmwTXVoPsUjU/zqe6FJwWqY
X-Received: by 2002:a05:6358:71c5:b0:130:faea:a81f with SMTP id u5-20020a05635871c500b00130faeaa81fmr3471512rwu.28.1688987494561;
        Mon, 10 Jul 2023 04:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688987494; cv=none;
        d=google.com; s=arc-20160816;
        b=Tu/opR0JleI+0R5YWc/SpxKKRc5LI/FZrXJV0Ls1i99+zo9T781UDZoJhv5m4TbaPK
         Z3FrRzGktdhT/5bHNjorc2Oeqn9aya+sJ6bNC8QriSjRPduFKPtHTGVBCAhClvdEUNzh
         SF/fYweaq7ek9GPQEvO+qWr6ctxRTBX37aoAturSM1XQsPhdgSPb1pCKyL2o/+UxNTbs
         4e0ftNJdG0itHn9WVZvDdO5Cohakrc+BhPR4BczHP/egMBx6mYXDNhB9BFTsb4eaOouj
         chsfM9GR7kEaOSnH0R7n8hLbDTypDSVaqSygI+018Ay8bM9ys0sy1mLwCAiX/gfjRz5Z
         1PnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/Q65nz3su02HpAugcKZK5cPX61qA+KCE+tRUgxH0yb4=;
        fh=dhvAILzDfZkivO6t6GYsPFqS5Uq9rqWGB6hQqhhyVls=;
        b=HrDKg7Uxn8zmIP8ZZNQbbbcsIiJ547TYUhO/YR7eUtMNNTfA0rT4LGTiNyZqTsqxxN
         Ru03GzutyxgK54IXHOxRayiZx+F773kNy89aoHUGPIoJoF7X7/Jwj92Fq2xVVf9vFqnt
         WJrRS25/hotzbP8Hd8ts9ikQFb+dgckpEDf8vt5GzdZ8lVIlfU1iQLbAptHUzt2PxSo9
         xWIvhsgM/TQAFGRzg83g3/8sFE8w+NwkN6sGnp4h49XGgK2LVf6Ndh0z+T5PhxOLbG/9
         x3GaKG3QapeYkxhRAde/EAM1CY7pAYSSLG8vg8sw6oQn7o7Ce+ZaPigyjAfXKhShijUq
         VVOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7wUft0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a05622a118900b00403acbce109si1057869qtk.465.2023.07.10.04.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 04:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7wUft0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIonQ-0002ex-F9; Mon, 10 Jul 2023 07:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIonP-0002eR-O6
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 07:11:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIonN-0003fh-Pl
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 07:11:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82de7so31767645e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Jul 2023 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688987468; x=1691579468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Q65nz3su02HpAugcKZK5cPX61qA+KCE+tRUgxH0yb4=;
 b=Q7wUft0fsbjzi0natv9S6Y/xJFjiAX6Wx1dxkl3lpaanELOpy9N8aOM8cK4/3uxiek
 AZHzbyVEzswKX6jkFz9Q6S9vp4+U0jt16nOzQmFs4KucTLP2p8fW1YkQNB+I4LIBNal8
 NGgS0dfJO7AD3DjYJQfnRJbCS3ARe6fH7EcRGLJkzCh66yA8vRb3N3hp6T2dUGkDfdZS
 HQL9+lndkdQIf2RhGkTo0QCnGFXqkr4fw4sK1Ae19NFZmmQyjXXOSuYMJpXL1Jh+sCrs
 XLSnugGzZ3emcKEKHKEu5uYwvMlvjg8ufZVKwLxYG+duA1o9sMwiRBSkxO7f/5gviCZN
 Nd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688987468; x=1691579468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Q65nz3su02HpAugcKZK5cPX61qA+KCE+tRUgxH0yb4=;
 b=WrMeXFODfVhKfQVev3VzbC+1W1Nn6gWuZ7DABT5/aNRfoAryGD33d7N4kIbSrUviSJ
 WuFJRPw158Or1a9TCpTiWUeDI9vEFBRS1ujVGUgGFPC6nZH5pCSN1i6ZhfvCEbiU0Bnl
 CQAlSw6+ixL7m2H+kiIdUn7/8zyYkSHGU6Z9AkihNAcoNzOg15z+7nlPKNkplukq9XHv
 Y6fsNR3BB4Ml9iRKHQdxT55ziwjkH3uTHSI1YH6MmCRbY+NrREyYhKsBWbo9P7ei0V4G
 ReM5l6G1je/YHy8nsm4f71ANNjoGCrf/ORoIUwh/kdJJqSTTiiwLj57QzlKfiWKePYrx
 B3QA==
X-Gm-Message-State: ABy/qLZftDqVKUW8TT+Y+5RBnZ4Ylfhp9MAlgBgF1sLauSbqCwdZPDTM
 6/kUjBEhe8UAAHgQMMllXGIx2w==
X-Received: by 2002:a05:600c:a6a2:b0:3fa:955a:9291 with SMTP id
 ip34-20020a05600ca6a200b003fa955a9291mr13908957wmb.9.1688987468296; 
 Mon, 10 Jul 2023 04:11:08 -0700 (PDT)
Received: from [192.168.69.115] (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr.
 [176.184.47.225]) by smtp.gmail.com with ESMTPSA id
 t4-20020a5d5344000000b0031417fd473csm11465115wrv.78.2023.07.10.04.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 04:11:07 -0700 (PDT)
Message-ID: <61904add-5dc5-6e17-f306-7fd3cc4b5f5c@linaro.org>
Date: Mon, 10 Jul 2023 13:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] chardev/char-fe: Document FEWatchFunc and use
 G_SOURCE_CONTINUE/REMOVE
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230705133139.54419-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lK4DduwfaUTZ

Hi Paolo & Marc-André,

On 5/7/23 15:31, Philippe Mathieu-Daudé wrote:
> Improve qio and chardev frontend documentation,
> have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE.
> 
> Philippe Mathieu-Daudé (4):
>    io/channel: Explicit QIOChannel doc is based on GLib's IOChannel
>    chardev/char-fe: Clarify qemu_chr_fe_add_watch 'condition' arg is a
>      mask
>    chardev/char-fe: Document FEWatchFunc typedef
>    hw/char: Have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE

Could you Ack patches 2-4?
