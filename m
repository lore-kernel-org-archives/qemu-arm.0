Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2582191ejb;
        Tue, 25 Jul 2023 05:47:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGyqNG8CJ+YCiga166J6HS2dvK3P46HbVgAxmn1+TC38QIXIZ8AJe3ZQwMsOQ/JxYyRUqv7
X-Received: by 2002:ae9:df84:0:b0:768:406a:2125 with SMTP id t126-20020ae9df84000000b00768406a2125mr2332076qkf.75.1690289257342;
        Tue, 25 Jul 2023 05:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690289257; cv=none;
        d=google.com; s=arc-20160816;
        b=N66bgxEvNUdst5NW6i8pwpy+nWLoRQW7kXRhT8qTn+0vUkGdDaCqQjkXrwUrH3nvwa
         z+y9IdHBwadrNTUE1aZNSr+9mdbRGQoFg+klwsKIVvSxa1YKooklXnvrl6ZnOldEUiTe
         3oMa2J1YlTVtfdLltVY7Z+qZyJ8Udx8OJ6O+e8/J1IZxwTRSgBw5cK1a0LVlUn2l0VRQ
         lCausgNK+BWK1/8evf7SNC/FE6ci6GnFLqxPDiH/V0Pr2rBTNgecNWqYQhK3/jKESPGK
         ZzbqK+5t79syCA2mU8yyiQmsKc1PZMvyuJhMH4b76hHyXDxjE7J9PjrM2eiAcLyq8tQp
         iCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sBEuv0tCJc8eX/yOWjLEnalpSx9cpWx5eKvD+ap8VqU=;
        fh=0M0TlrJ9fkZsL3e0wS7ddJxfdinhoqiktylMZ0kLP30=;
        b=EijdwFuDZXyxjOTF0F8o0U3YYsq4v4LUSiUtwsul41LiX0kiwN3YLjE+yJTxxu/MfW
         1wU0wI+HpZNvI4a+DjgjES5GIzK8lVXg/f30gm17DSgLQyHg13J5SGEtnapMpcW/MiVc
         NlybMMAEfkCcFW/lEm+IqWcbh3z26OkXULtZyhIql+/x3Gro9lw3DlTbsVNoK568aFTW
         8cdYN3rD9oCyHpeRxfSxQ5HQkjv6ruwmhQNn2guRCfJ205yVyPV5JUOKZi/i1I3cjKNK
         EpypSQieR2NFgYFpOEM9/J+W/eeTyhsWRuv6+HJxp/fLVoK4Ym9H9awsUQ63XqcpArmH
         cnMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B7PqaKPE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020ac87d10000000b00403d7809e5fsi6394070qtb.62.2023.07.25.05.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 05:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B7PqaKPE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOHRe-0007gJ-SJ; Tue, 25 Jul 2023 08:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qOHRa-0007b3-MW
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 08:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qOHRY-00059d-Fs
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 08:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690289230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBEuv0tCJc8eX/yOWjLEnalpSx9cpWx5eKvD+ap8VqU=;
 b=B7PqaKPE05+7MjJkpjXUczoKSAQXHBa4bLE6AqzyvxxBJkep2xdVu1MySk5RpEbf6nQsXC
 iWc5D/46G2mOmdJWWFdnzkJt6g8u41yCix3sOl/7+6aFL4ECLYB6W+u/0PVgKiyYMqJRSU
 PpJXLwYON58x6VtOHMuRCk/H/VEpAv0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-8OO5X-w_OuKqi8_F8YsS7g-1; Tue, 25 Jul 2023 08:47:09 -0400
X-MC-Unique: 8OO5X-w_OuKqi8_F8YsS7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-315a03cae87so3076749f8f.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jul 2023 05:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690289228; x=1690894028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBEuv0tCJc8eX/yOWjLEnalpSx9cpWx5eKvD+ap8VqU=;
 b=DkhsKe6smSkdogUlvEzrgrXK6Nl/r9k6/f5QGwlmr26JQdec1YdLt360rz+dtY3ELb
 axMnjaboRmul6G+ljX67U1OLuKAbBWzy15NL4Lpcz4/1KLN26aRJgMGRHb1g5HM5Ohrw
 imc+Erl8NNqcW5wzPNEbKAXtTejKYBp6VQlWoY/rZFTxZsk69lt9WLDf5ydq15kdtn1+
 ZqzaxCJewqjMRAL4LUC8VkdphHjTtWUsWR2englsvxkfVcUR13bFpR1+VYlAWZqLv7Ci
 OFZvrTJnYjiLMXfNduo7Ke0uj+jhjPazCAwI3ymiiOBCQ1TgeZ0zREG6jdB4MsYgH1hG
 eLrQ==
X-Gm-Message-State: ABy/qLYbeU5crtq5welXRh0orswAeuZa7/bn689xaZeIwgC/UjYb7m5l
 I2il9ZzDbbjDo/RRtwyIJQyusjt5MENT1Ro1sascsI8dNpYnWRMHB5klUlSqARAHHSnXMB2Quee
 Cu0g4AwL/m2sG
X-Received: by 2002:a05:6000:180d:b0:317:5cfb:44c7 with SMTP id
 m13-20020a056000180d00b003175cfb44c7mr2171610wrh.30.1690289228485; 
 Tue, 25 Jul 2023 05:47:08 -0700 (PDT)
X-Received: by 2002:a05:6000:180d:b0:317:5cfb:44c7 with SMTP id
 m13-20020a056000180d00b003175cfb44c7mr2171593wrh.30.1690289228225; 
 Tue, 25 Jul 2023 05:47:08 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-31.web.vodafone.de.
 [109.43.177.31]) by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003fc0062f0f8sm13346012wmh.9.2023.07.25.05.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 05:47:07 -0700 (PDT)
Message-ID: <c6c1e1da-f5f1-1535-9b9d-88278c050cb9@redhat.com>
Date: Tue, 25 Jul 2023 14:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] kvm: Remove KVM_CREATE_IRQCHIP support assumption
To: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mtosatti@redhat.com, peter.maydell@linaro.org,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, dbarboza@ventanamicro.com,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230725122601.424738-2-ajones@ventanamicro.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230725122601.424738-2-ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: K0RjT8f1itmR

On 25/07/2023 14.26, Andrew Jones wrote:
> Since Linux commit 00f918f61c56 ("RISC-V: KVM: Skeletal in-kernel AIA
> irqchip support") checking KVM_CAP_IRQCHIP returns non-zero when the
> RISC-V platform has AIA. The cap indicates KVM supports at least one
> of the following ioctls:
> 
>    KVM_CREATE_IRQCHIP
>    KVM_IRQ_LINE
>    KVM_GET_IRQCHIP
>    KVM_SET_IRQCHIP
>    KVM_GET_LAPIC
>    KVM_SET_LAPIC
> 
> but the cap doesn't imply that KVM must support any of those ioctls
> in particular. However, QEMU was assuming the KVM_CREATE_IRQCHIP
> ioctl was supported. Stop making that assumption by introducing a
> KVM parameter that each architecture which supports KVM_CREATE_IRQCHIP
> sets. Adding parameters isn't awesome, but given how the
> KVM_CAP_IRQCHIP isn't very helpful on its own, we don't have a lot of
> options.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> 
> While this fixes booting guests on riscv KVM with AIA it's unlikely
> to get merged before the QEMU support for KVM AIA[1] lands, which
> would also fix the issue. I think this patch is still worth considering
> though since QEMU's assumption is wrong.
> 
> [1] https://lore.kernel.org/all/20230714084429.22349-1-yongxuan.wang@sifive.com/
> 
> v2:
>    - Move the s390x code to an s390x file. [Thomas]
>    - Drop the KVM_CAP_IRQCHIP check from the top of kvm_irqchip_create(),
>      as it's no longer necessary.

Looks good now!

Reviewed-by: Thomas Huth <thuth@redhat.com>


