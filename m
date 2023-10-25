Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2620351ejb;
        Wed, 25 Oct 2023 03:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN/n+r9WSKQA0VPOJGjCw4mFwkis31faYwqVObC0XZ3c23uPXbPqUNToZzseoo760GpHoC
X-Received: by 2002:a05:6214:130b:b0:66d:ba80:2324 with SMTP id pn11-20020a056214130b00b0066dba802324mr11740982qvb.41.1698228002820;
        Wed, 25 Oct 2023 03:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698228002; cv=none;
        d=google.com; s=arc-20160816;
        b=IleXmkNG1YxJSUfiYuuvnSgy0YGl7YDJlvqeNC+pcS4RbxtlLvRYiE+ZgahMGCsYH9
         qDEY3svp4hLPxjboB9Erpzpv2oDImfdxHO6UNcf/5hzLPLvS2D+T6r3UUfAOPx2EAsAY
         Z/Vyx3nAXFN3KIdUC7YXC+byf05nvHiwDtCIMe8Nqu4/J42aGr+lprykE6EzMB7vUjaH
         97jUgsptfvOUR2ae80rPI9JUSx31fp5qvKXhNtN3MgHM2/lwVn3vhXJlF7Uwqck7OzXR
         NdVEtmnhOP+tjWy4aZOCYBYD7CtYj6sMWHfHA2aabujBVDgEzHR26df+b6j6es271Kmk
         J0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=OTauERrvZ4a7OhK7D7fwk1CM2WdQnSsmEArM1vxFR/c=;
        fh=0SwnxTk/kH/eCu4S7mbtHkWoZOqjr8yjdh6t+AwknJ0=;
        b=J5ENuxTBSpRzOC47EM2A60YHss6EAFkhcLXkNlBV81wVxj3yxkBLXFP9HfwXePBTpK
         5nJMNal2wf9U6yOAH0yqwu21sikIU30OjO9mk6LYt8zx0hgbqFy9TxC3o7Mz/Wzq+qj7
         4j6rw816e8H05YO8ZNj9EHnEtpWUNikYRSrknG8sej8iGF+R+vwxErBAUm+gkorI7+Qt
         Esg+LxnHwJ5NRXjBfDF8gzvs30Ijo/W7iP1p8pTGlDYgvV9Shcpk3vLEUeSS2jZL/vdP
         Jp3Yab849WOvJZ/kMJ9XW7A0C4RzJ4Al3BrxVkSDYcXGef33ZyTLikjeozF1iuagdLzL
         K2sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqksLtFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020ad44388000000b0066d04191891si8132603qvr.317.2023.10.25.03.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 03:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqksLtFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvafx-0002zy-2h; Wed, 25 Oct 2023 05:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvafv-0002zh-LW
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 05:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvafi-0007sD-Dd
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 05:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698227969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OTauERrvZ4a7OhK7D7fwk1CM2WdQnSsmEArM1vxFR/c=;
 b=gqksLtFK/vGO0+etscDBLGrGZAqCqlMyfkQO/ucKfhtOw6djq0IWlzkgyb4GKM95uSGBZK
 PY3RQ9cZ445KmpykOFM6MgXmn7KZswqc0KakPEgQEBtYKpj6xqF4Q8LOWDlAwdMjKrLbVG
 YW50FsWrguHwcuf00tHFDtIrbgzidNA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-GWPgkFxuMuSfBfqogF0--A-1; Wed, 25 Oct 2023 05:59:27 -0400
X-MC-Unique: GWPgkFxuMuSfBfqogF0--A-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-41cdc542b56so64177951cf.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 02:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698227967; x=1698832767;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OTauERrvZ4a7OhK7D7fwk1CM2WdQnSsmEArM1vxFR/c=;
 b=qGT1fFpaENUQfoS8k7PK/r88fb+JPxvT2mHlShdLi9jjyQGKsR2QYdy4fdilPcW/kJ
 JGLpBYmxIJPlU8irwE3FvR+QvjrDdUE8wz+kY//38zJOuprNjI1pyYjDpP1tR9mivRkl
 lEDacbJLQ6TdcAvl/LizE7AdIx2RGOfCmmEQGuQGkGEHjABPkio4SDqpsJ/20CCvt0DA
 o5wuLR0KtnHWvGiiSHbxAZ0wSYNYCKkm62puGABQOBV2dJgbNkrf6CShGf3F04+l3dyi
 r4lm6Sj5SSBi6gExPIprdd9fJCFVi2PQcjUhRIZttK76/ysaPUWmDEsu7No/UXnw1LNW
 FfEg==
X-Gm-Message-State: AOJu0Ywp4kffAHpjpou42UHOCi83aDczUfefQ+9Osj8ewfiVCFR/d3W9
 z7maFKkwbEIMIwGuzq3aW/g/XRl1KDFHASqvyH5dUyE6OYNGwzSPTq58LBWwYMJqH+fPQs2l40E
 ZGarp+3mtVcRm
X-Received: by 2002:a05:622a:549:b0:419:573c:59a4 with SMTP id
 m9-20020a05622a054900b00419573c59a4mr22097578qtx.20.1698227966945; 
 Wed, 25 Oct 2023 02:59:26 -0700 (PDT)
X-Received: by 2002:a05:622a:549:b0:419:573c:59a4 with SMTP id
 m9-20020a05622a054900b00419573c59a4mr22097559qtx.20.1698227966691; 
 Wed, 25 Oct 2023 02:59:26 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 e28-20020ac84b5c000000b0041cbb7139a9sm4090437qts.65.2023.10.25.02.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 02:59:25 -0700 (PDT)
Message-ID: <c2ab022c-45fc-4836-8f00-0169f9fa369f@redhat.com>
Date: Wed, 25 Oct 2023 11:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] ui/vc: console-vc requires PIXMAN
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, qemu-ppc@nongnu.org, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
 <20231023113047.2572137-7-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231023113047.2572137-7-marcandre.lureau@redhat.com>
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
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 80CHA07NoGo7

On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Add stubs for the fallback paths.
> 
> get_vc() now returns NULL by default if !PIXMAN.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console-vc-stubs.c | 33 +++++++++++++++++++++++++++++++++
>   ui/console.c          |  3 +++
>   ui/meson.build        |  2 +-
>   3 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100644 ui/console-vc-stubs.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


