Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp171742ejb;
        Fri, 17 Mar 2023 16:25:12 -0700 (PDT)
X-Google-Smtp-Source: AK7set9Gos0y8e22ROg6r34wQ5GGXTPRuIz3y7gAAwnDeBLchaRX4Ruwlq8AokFegxT3QrpoqR1b
X-Received: by 2002:ac8:57cd:0:b0:3bf:e320:ba5d with SMTP id w13-20020ac857cd000000b003bfe320ba5dmr16689524qta.17.1679095512401;
        Fri, 17 Mar 2023 16:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679095512; cv=none;
        d=google.com; s=arc-20160816;
        b=hVWrkvHYSw0ZgQu7TRUt3HUwGWed7ggI+fleMvyymte/MhEO0DcJ35g0SZz5QTvxjP
         6SU/qZPzzFNQSdKwlXAGDlNZbxXsQ+al/T0tTixAAMrshM9lzVfxcB6g8SdeDtpLTEGH
         vx4qf68eI8nY5D95NAS+zxG8TIDAoDVF/zZClSJc6MDyvDW0thGJrjnPJXWBid3ypvQX
         NZecJnEEGFuy8yp97mmhWZFleXLwHiPyPufvbFbrOmdZt3xbVIPK0/heLZk+qvaeeX6Y
         rXRO4G4bpAl2/hKbkWQ9Wh58hJKNUSflfCj23e50iJDw+sZ6ykhEWbCQPNGgQiuzlipc
         BOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=dH3p97h/EAUFoh5IOOrT0ILgfSJ+vnvdG3hCCHLcdPk=;
        b=pzewgEQxVmVlkcZoQrTIbre7nuRIkvu1kgw2YxwkkNSV4gPSCqxPboo5+QzIKHbWXg
         4X+cYbCVed0TG4B4YNZEclSbrOUId+PV2I+uiWawXYb4IjrptB4NOncuSVqFFrUaTrzl
         4MiUOGr8ERp2rK+Zv6icQHataHrK8/JZSMNNwoPTi5jZxvyZoCrIh3On7oBIMQB/f4tu
         Xqok4dae/WvFypEdoQIqLTKTElD1+SA0h+B6G5Mkm1/e/RT5HcXMHZxWJ2OXfvhVuz+G
         9m0cUmAvrqHH3uGvzAk0B+9Q6jQHQETW0SYmCACtHkA8I91UUWqEDG2nVisMo+T1VBzV
         vVDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20210112.gappssmtp.com header.s=20210112 header.b=CB5rN7p8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05622a100900b003ba260db124si2296548qte.594.2023.03.17.16.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Mar 2023 16:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20210112.gappssmtp.com header.s=20210112 header.b=CB5rN7p8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pdJR3-0006k9-JN; Fri, 17 Mar 2023 19:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pdJR2-0006js-3U
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 19:24:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pdJR0-0004H7-Fd
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 19:24:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id h8so26149304ede.8
 for <qemu-arm@nongnu.org>; Fri, 17 Mar 2023 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112; t=1679095468;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dH3p97h/EAUFoh5IOOrT0ILgfSJ+vnvdG3hCCHLcdPk=;
 b=CB5rN7p8rFRCRvY5heaLi0N3iyL9Yfnh89EEsaCcJRzuwQYnAKhWOLpaCw99+aze3X
 J5H5HczKYqVck1WhFuv5kLxBZ6STWx+mOpNxub8UIBH+GflascjIQFo258I29Cp7vJ4a
 yVUGIaahPSJ9cDKGYL/gXoqw4ozSEe9p/HXZPPN9fz1AzaIukY09ch/84A0A+sQt19MD
 A8bU9H9FczE1WpAMT8gKyIcoXoK/CroJQmmM2mn3wDOHJKSHExFezhOj1gF0gpvkqaTp
 jnsJBv8KVzSSOc9aml8ORWrkZPVSmTtnuCeXHI37LddH0HREhKF2TdHOm6lusZo5qnHE
 lL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679095468;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dH3p97h/EAUFoh5IOOrT0ILgfSJ+vnvdG3hCCHLcdPk=;
 b=Ib6o+qRKz4gIcQKyWoPuFqi82h0REVuBNkdluv7SLpvPBjEQuGpswcvV4DENS/WFd8
 x4+m71fvkm6j6WYKjF2iSiicOifUkPeMhGXg24PvR6hlk+KyA4Spjm2+KaqwbkTx0b5v
 Zrl89+74gns4rKdIqC+plmpwDkmDB+XEKgpKP9QjBZ/HdH4Z20EfsZK5gR1GzfveUnAU
 UFCJ6iKtCRzHxji+tubpfejIa3XthybuxTwnGoSKSiTm/QqwGCkfcitdUJEUeBEjljC1
 4CjuoQVGMpEinxYYX19ReUC34C8y5voN7xLQ71sG9M3tH2y5Mf93jVoI3E0AVbVXW/Wc
 ECTA==
X-Gm-Message-State: AO0yUKWC1BJ1foMQeE6nWrscXrxZvDjPdN3k3P2C5JdSyVeaKi4mL2xX
 rq+jSGo93CPYkd9i0rC9mHh8ZQ==
X-Received: by 2002:a17:906:5393:b0:92f:7c42:8631 with SMTP id
 g19-20020a170906539300b0092f7c428631mr1033339ejo.16.1679095468652; 
 Fri, 17 Mar 2023 16:24:28 -0700 (PDT)
Received: from smtpclient.apple ([188.25.247.154])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090624c300b0092a59ee224csm1457961ejb.185.2023.03.17.16.24.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 16:24:28 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH] Revert "docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation"
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <20230317165504.613172-1-thuth@redhat.com>
Date: Sat, 18 Mar 2023 01:24:26 +0200
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?=22Daniel_P_=2E_Berrang=C3=A9=22?= <berrange@redhat.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Transfer-Encoding: 7bit
Message-Id: <A0D0927D-9A93-4E51-B69E-A1BD926D66F7@livius.net>
References: <20230317165504.613172-1-thuth@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ilg@livius.net; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4yXBYjj8D+39



> On 17 Mar 2023, at 18:55, Thomas Huth <thuth@redhat.com> wrote:
> 
> This reverts commit 1d0a8eba38cdddd028ea02c6e0b68f0a4c9a3cbf...

Thank you, Thomas!

Liviu

