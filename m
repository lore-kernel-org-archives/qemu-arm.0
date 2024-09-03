Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1524367njf;
        Tue, 3 Sep 2024 10:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrkKFED62IJ07woQUWP5b7q3/TTH8xPr4iUN5TZab5R2NQHv8Re6z5WZY/rK6ALPAmjhkri5yQtSTDrA==@linaro.org
X-Google-Smtp-Source: AGHT+IFS83b+FzEwZLLUq/8Ua3BNBayJ7WYSoRk84mlnb52kdmZKQm8ARWj/+lt0pIP/gQgOM0ZI
X-Received: by 2002:a05:6808:2e9a:b0:3e0:f75:dff4 with SMTP id 5614622812f47-3e00f75e1b4mr2391393b6e.29.1725383772442;
        Tue, 03 Sep 2024 10:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725383772; cv=none;
        d=google.com; s=arc-20160816;
        b=VSJ/6DiUds6Eoc6bpCTymJYcUu0kSrqxjA4UJYqodWMlV6ramTPs8K2l+wAnjz7cTc
         6Id3hJQyxOGct5kq4SccpnnYWEuOFPRjXURfyEnh9un4AB++B8jTJgAEikI00XE3Neo2
         iEwhDFu7eCAhcCn180MvP00VAl2pyWsittEJwh3E9ITDKfemaBJsBx6fhxk10cGYPriX
         P+dkAGJnEn5ZL0OcBTSnSojlJ/RHsPEwSECHxQBT5ilGYcBP4tFQ1DR337XZjGexhQER
         iOcEbrAQLHiueROTSumrbhq++mbWFK1ajqAAX0+bwHvOQx4GXZZExEAzr8z9Qiplzfog
         BXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8z9IuWVwM90ATBC0rbg4REiIuxiuTPKKJcmhSRpEp+g=;
        fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
        b=H+bWMcAsX8Hsbfe7Ay5rzgkIajBZyCHyyQOe60FqQLLFITuJOD8PbJG0kpc8PsGCX+
         N1xNyd7kS1z9SUdtaxw4MbcmLbK8GhEQkNPwenNI6wPd5qDfDJ3PrNFEmS9p46GNBd8z
         5fPeDRBaa1XW/kjvQeK2Rh5637Mpw7N+cpMJFu5QUyYHogGnf57DvWb7m6jQqiAeMsS3
         z3Hum8hhdnYLR+K2oS10uwHqM1lqbVFskyVL89c/RXJpM5lrmJVn9tIq6IKYVxFHw6jJ
         EGA771c8gU5uZ8Pixvj8w46PKmaZD/UUXLa4BINqIsSHxFL3lrNwJeXibEzjyx9aXSds
         NOlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L7iKFKod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f4fadcfsi3294700137.315.2024.09.03.10.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 10:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L7iKFKod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slX89-000229-TA; Tue, 03 Sep 2024 13:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1slX85-0001kw-If
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 13:15:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1slX83-0003Eu-Qm
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 13:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725383741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8z9IuWVwM90ATBC0rbg4REiIuxiuTPKKJcmhSRpEp+g=;
 b=L7iKFKod9vbEj17qFC3/9yUJWvQcPEfyN/ZRY95aSudaxOF7dWnDaAE8p2r1EHvMqtE8wg
 F2uDnff9KoB9BUoGIaXvhJYS03ij/Tvs5MO0Sjfy5cGbl3OX3DnCTu2mfrtZBhoVq0CPNB
 opJ3L4YCBvKupxmCvzsM7ErDtRegxP8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-I8KS9geiPsmoFHX1seZlfQ-1; Tue, 03 Sep 2024 13:15:39 -0400
X-MC-Unique: I8KS9geiPsmoFHX1seZlfQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-7cd8d992cb1so5120669a12.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 10:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725383738; x=1725988538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8z9IuWVwM90ATBC0rbg4REiIuxiuTPKKJcmhSRpEp+g=;
 b=YHQJ+gltMBfvtRd24svgH3CggpBKonSWd6eYRVvwQa0YlsPGsVV3NEyHH0vyug9I3J
 06oqhzoW4rm+vrs8x3djmRRZ8oNskya9r36ckEhjoBWCSGZRzL7li6wq/g7fLWmPSbWW
 P4U7/ls5136OP6sVVgBnnJ7jtFthTXXh1M6dU2YJ5qvjhnd/+ML4nwny/wxhHjvbpUD8
 VSLZtfrWAVh8Hvz1wnm7ylETR9whs1LdL4Nl4xcMDV3TwC9b7S0NX0JM1Ov879+d6R6m
 VkuTh7Rj6GQ0iPUCCQpNC1VJVCCHyGW5mcgrT/Em+sCCOsMOefp+XLSAm1EFNfcWJ8lx
 ntdA==
X-Gm-Message-State: AOJu0YwchqcHqxmIgmu1TI9OFyLt7Uv5lEQRH1uc/l00Fc7THn72xcFp
 jsdGtxD/H29oE7I4tg/6k3+SeLZZFMM+5GXoBOpJGBjalEkALOUVWJb96cs4//nBopJ6aAPoiDU
 Jt85Q9HnlhnpNYXcCNTNptZHEtxjiK1NQj8x/IuH+S7EFcC3IeWxt0iM9au2QS1WeITO4eAAuzX
 I92IO2f08IRXyrHw7MFdVBhujV
X-Received: by 2002:a17:90a:ea93:b0:2d3:bd6f:a31e with SMTP id
 98e67ed59e1d1-2d88e3e64dcmr11303765a91.28.1725383738456; 
 Tue, 03 Sep 2024 10:15:38 -0700 (PDT)
X-Received: by 2002:a17:90a:ea93:b0:2d3:bd6f:a31e with SMTP id
 98e67ed59e1d1-2d88e3e64dcmr11303740a91.28.1725383738049; Tue, 03 Sep 2024
 10:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <762867ba-8980-44f6-a9a6-5e766bc6a60b@redhat.com>
 <CAFEAcA-uTqq9Ke4pS59aQ_9t7KObRxff8DN_rY-2JkfSCQkASQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-uTqq9Ke4pS59aQ_9t7KObRxff8DN_rY-2JkfSCQkASQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 3 Sep 2024 19:15:24 +0200
Message-ID: <CABgObfY--e1h=fEC=7TxA9eaHog1N4V4+3oEm+W_RSKEEUSU4w@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: YgpfX27ychsG

On Tue, Sep 3, 2024 at 7:04=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
> The PXA display device doesn't pass anything through to the guest,
> by the way -- it just draws the pixels in the guest framebuffer
> in a different place in the UI window. As the FIXME comment in
> pxa2xx_lcd.c notes, this should really have been done in common
> code, not in a specific display driver.

spitz also passes it through SPITZ_GPIO_SWB ("Tablet mode"), though
it's incomplete because it should have treated 180 the same as 0.

> As we both note, the UI input layer part *is* generic code so it
> will do the rotation regardless of whether the display device is
> also rotating the guest output. But that seems to me more of
> an accident than an intentional feature.

Yes, it is, though it *is* working. On the other hand I doubt anyone
is using it. Since we have in the past removed single options like
-alt-grab, whoever needs it can resurrect the code from git and add
the options to -display. They can also add rotation of the output as a
separate knob from rotation of the input.

Paolo

