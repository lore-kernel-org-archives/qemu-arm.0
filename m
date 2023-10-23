Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1171124ejb;
        Sun, 22 Oct 2023 23:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2gtROpK8zkdLYTyNMpnGzfSgODcJjNqnIeUESMNVLhAtxmDOhUmc4ucS9HcyqeWArNMce
X-Received: by 2002:a05:620a:c4d:b0:773:b50f:c6f3 with SMTP id u13-20020a05620a0c4d00b00773b50fc6f3mr9165030qki.52.1698043623362;
        Sun, 22 Oct 2023 23:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698043623; cv=none;
        d=google.com; s=arc-20160816;
        b=I7X/or7iuUcltWHvMYMmKbMkdCzZlVFA9Cznm7ApoGQNz4o3TebLhpOhxJ93jlNjrc
         Ail6k5vgWO95UFmEGvOjQAvDun/MryAlk0JR7Ajvasv7zcpgBPHsilSHCz68gOL/bgx0
         63OzuAjyoGZHjoI4rW/78RbP72iKVjxEb994PQJIM77MME+u55RyIkpmm2QdsmMvWggY
         2L3AH/VJORFo/eGGUbRQ5uiSW0+fHCFEwUFYyF+LXHuseZBYe30PKWTgmZK/RzqPlK57
         I8OIKP8NCT+dO2Ax3Rutmn2N5BmRAoj+MJvq5d/opYM6HoZa54C44uWQHhIj0ws9lynU
         lhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=5CC1c5P4CeNm/9XLiFqn4P/uGJBD0H9R+xNEi4Iddz4=;
        fh=DpkbP7dEedV4PMQm4eXqOJbSESG+s5DDiq4o/Hms8vM=;
        b=IVczIYWNjBq3lEqjbK1pheW4sjAdnO4bWBs4Ah2BVzKL+x+Q5W2xqIRTm06aOhgV4+
         cSkzeZEjreoZhr8lZSqc6w8XIfD5e+lRTDxW+EpsNekLKQ/9d0KVt6pNtMSa4HlnC3lm
         jrq7IbVF8quUBJ20Kqls7oehS/cSHoUJvQCxEDy/leHHLNb7go3jWiID0ct24501CAqP
         cudWsRqSb2s7i2oDUau8Zlgnw/NgOKZHU0FFp/RL7wWQs36KiPtZLdAA3op1m0HJoxjX
         yqeg50WtTAnfBWDBJMJA9KTv2P/79QZOe3ubW9kbUzXxah8Z07PJ/Zg01j8vK0cryWeL
         wkYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WfVZfyO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23-20020a05620a119700b00775cbd321a2si4807986qkk.586.2023.10.22.23.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 23:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WfVZfyO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quoiK-00040d-Nw; Mon, 23 Oct 2023 02:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quoiI-0003xc-Ky
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quoiG-0001SA-RL
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698043616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5CC1c5P4CeNm/9XLiFqn4P/uGJBD0H9R+xNEi4Iddz4=;
 b=WfVZfyO192p4Xm+OwS4hl6HXMrHoreyAhRz9BUd3K37zJPNGXwD9w8Goohsf+tH4Ou9GP3
 NFGlOgU90l83KEZKGl2FPU7SIZOvpmxJRINLcy/hOLPInL7lShNY41B9AxrFWdyLP7k8zi
 V6IcUggNvsiPNR6z6nsm71aG9+moE+0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-Xrd5GyX3PuaApfc3cGEA6Q-1; Mon, 23 Oct 2023 02:46:54 -0400
X-MC-Unique: Xrd5GyX3PuaApfc3cGEA6Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9c7558b838aso178228966b.2
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 23:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698043613; x=1698648413;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5CC1c5P4CeNm/9XLiFqn4P/uGJBD0H9R+xNEi4Iddz4=;
 b=ZLEdaMqYyVjhbfV5Lng3/6CEod7j2cYJm/+v7oxW9w5OxY59mXvR8bV5OKZ5hNv92D
 g6RuK+1u04X4pjfF4Kgm9zc0+VENVtUGhpTEYUzfJJPwS6pm4Rqi3H9jfiygYpmAhMU9
 fcFk/xwIW1ZNbPeDy119olv8z9zH8CBoPJX6qJEBYNqcQkv8eA7gPS2iqT7F09k806wr
 Fchf+ZDj4omINCDyuA+80S7kslA55JyXRfC7VouaNNNC8G98Bp/68MIX18ZCBAf6woN7
 LIQ8zLUJ7MEsInHW6u8cVxsO5JcMm4cietmsb3nocpdFTGRiXuXfA7pjyO2AXhqcwL+/
 lluA==
X-Gm-Message-State: AOJu0YwvlC8A6W0EcevCfS0oO5Q0mEjyYf+Ouz4tBAhO0CwBo7RWaWC7
 3vYGYiIqpbo6Nv3tQd3Al/9NJMzqGI24FIX9UmQpkg6BqSR/FPSVSB3QPGh59TttQhhKeWhBttf
 avSaIa0LCAdxL
X-Received: by 2002:a17:907:608b:b0:9b2:9e44:222e with SMTP id
 ht11-20020a170907608b00b009b29e44222emr8254424ejc.19.1698043613705; 
 Sun, 22 Oct 2023 23:46:53 -0700 (PDT)
X-Received: by 2002:a17:907:608b:b0:9b2:9e44:222e with SMTP id
 ht11-20020a170907608b00b009b29e44222emr8254414ejc.19.1698043613443; 
 Sun, 22 Oct 2023 23:46:53 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 u16-20020a170906655000b009c3f1b3e988sm6062764ejn.90.2023.10.22.23.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 23:46:52 -0700 (PDT)
Message-ID: <6f06be57-f065-4a40-bcce-b73740f87e36@redhat.com>
Date: Mon, 23 Oct 2023 08:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] hw/intc/pxa2xx: Factor pxa2xx_pic_realize() out of
 pxa2xx_pic_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231020130331.50048-1-philmd@linaro.org>
 <20231020130331.50048-9-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231020130331.50048-9-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VG8Z09MHSFCC

On 20/10/2023 15.03, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/pxa2xx_pic.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


