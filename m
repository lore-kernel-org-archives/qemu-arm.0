Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp411168wrp;
        Tue, 3 Sep 2019 05:54:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2KPsXV2dmCZWXYvDOGVd6Koh1ZpM4PeTbvQBie0I49bDu9m5eiiro8IvxotRaN/0NSLBa
X-Received: by 2002:ae9:ec06:: with SMTP id h6mr31120384qkg.221.1567515268846;
        Tue, 03 Sep 2019 05:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567515268; cv=none;
        d=google.com; s=arc-20160816;
        b=Tp/S30Z5TCnyfT7cpqqZo+prn3bzuPbTKetIG8mNk5Hauk4CH4LSGNaHkU40/Z4pvS
         9LswQbb4g3LG7LjKHVf5JqLoi+oR6/UII3cxB1ungpQQoA9qe413+UKmjnhW9VrH4SFm
         PBXDTexd46nQohgL0oO1zwejiGu0L0c5yIsLMEW/i4ZhJvvPXHrebLY+O0rO+EUEBQv7
         O7+1MaYz5284jsZqQFwmYWMNrJMxyeNBIseLVkmq3aL3VBgnUYFoO0cY4klY/VjO5+91
         BxR/oUBefdILsvgMwgh+cKell18UkckSmMOQJTc25DTe+x0qPcdSSMo/DRwEdcNyoIKt
         6TXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=5xd3EaRn2/q47I0oNhUyeFQqlRFbIiY9Dujex2TLBtE=;
        b=S+F+pX0LRVDvZW6g+N9dEQxAidYA0VLUXjKdYWud1F6qCAyliKOFVSK0CYYYAGJRgT
         9wPgxEfwcsqCNr708MPiRahF3Tx8uD8qC1GMuaCua49rGt90sIPYih60RC65AfssRJzm
         HZcZcbK4NLwn5OhnCRIoFrTP/Uj6+0hZK1WmUVlM0dyBA5QFCZxaA54EScSmXu+g74Qu
         G7XQwecFK54byFTawhX38naPH2V1MqxPGa642q8e+AXEkhV1hxSkjskKikvel8ya7YTe
         jLB3tnxETJtL7dB81s5cOYzgv62Jc8adRSFWB837wW3NtmQ9l7ye0lOZy9IDdj9anAtl
         +IxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MUTil/mW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si11171650qkl.107.2019.09.03.05.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 05:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MUTil/mW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i58KK-0002DB-7k
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 08:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i58KA-0002CV-6r
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 08:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i58K9-00053W-0q
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 08:54:18 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i58K8-00053E-MI
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 08:54:16 -0400
Received: by mail-ot1-x341.google.com with SMTP id c7so16635731otp.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5xd3EaRn2/q47I0oNhUyeFQqlRFbIiY9Dujex2TLBtE=;
 b=MUTil/mWWKOPRn6ZshL2JxTs0dGLnHI1Gtko++MOKsNzgFnn3GjPb4Mwa+qjn+3QgU
 SuE1gqIuSiFLZDEknNuHr7rXM2JCrs6f/0oo8m79U68DnbfL9EOqKQs6fE57KyliXVro
 +Wq8lLXuPVFFXw5njKbu+T55O29HHhijETIIWRxQ3z6kCslsWO7TRY6RC4KNFshQzuEK
 FLsfvfXRZ24Z7tAgFnA3zTPXvHHsGh2a/5HBgPtpF5rbcYlGzyTWpjG1AvOAP2GpgRbX
 kyE8JEouyLqZE6RCubN1sCvu2CYh+1uutaq4R5Lf21N4IH6K4AxtapXyVE3p32qWFC2i
 NkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5xd3EaRn2/q47I0oNhUyeFQqlRFbIiY9Dujex2TLBtE=;
 b=NCQ5JTaxzN3FdPLnw1K3J1raKVRCwPOBfyjenimufW4jgqWMkTb5MOZP+pbkslT0d/
 b5mTKa4UUpiuNTuVPn43TIxPaxqWvYlUEHoLi75F+c4zm/5ESLxWJIRjR78RHyUf31xJ
 0auseqYs1LqskypPYLaclUf64nF3cG24bRgFo9b9I5Sv/AGv+28YpkrbhKq5d5mZo/3u
 Zovjf9tNxVysktU9gOXG/oajxVlWAUJUtHh9rHAZeo+x10Uao855fiXqpSL5mARPqXsX
 w43pb9DBNZfG2zRihJpOBhD0OpQ3fjnibMCCVYoigFicY03kvAzMw5hUlaJJ1vDAv7Ah
 s76w==
X-Gm-Message-State: APjAAAURiZMOFiEWpzXVdeSxrOudycikTLIbId/ILtEaizaI1OhdbZrb
 oUXI9gSWZxmg7oztWC8zg6IvOKxxMNVsZyLBvYhXqw==
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr28991001otp.232.1567515255849; 
 Tue, 03 Sep 2019 05:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190823143249.8096-1-philmd@redhat.com>
 <20190823143249.8096-4-philmd@redhat.com>
 <da63a29a-c60d-7f85-aa4d-27d750f4d33c@redhat.com>
In-Reply-To: <da63a29a-c60d-7f85-aa4d-27d750f4d33c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 13:54:04 +0100
Message-ID: <CAFEAcA8xJCBKWYwEd4vhDoFcZCKyzFgaZxv5i=D=h40LLoG9FA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 3/6] hw/arm: Use sysbus_init_child_obj for
 correct reference counting
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h5T5MsAINvy5

On Fri, 23 Aug 2019 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
>
> On 8/23/19 4:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > As explained in commit aff39be0ed97:
> >
> >   Both functions, object_initialize() and qdev_set_parent_bus()
>
> Commit aff39be0ed97 was not about qdev_set_parent_bus(), so the first
> sentence sounds somewhat misleading here. Maybe rephrase the commit
> message without that reference to aff39be0ed97 ?
>
> >   increase the reference counter of the new object, so one of the
> >   references has to be dropped afterwards to get the reference
> >   counting right. Otherwise the child object will not be properly
> >   cleaned up when the parent gets destroyed.
>
> Well, the parent here (the machine) currently never gets destroyed ...
> so unless you've got a patch in your pipe to fix that, too, you should
> maybe also rephrase this part of the commit message.

How about just making the commit message:

Both object_initialize() and qdev_set_parent_bus() increase the
reference counter of the new object, so one of the references has
to be dropped afterwards to get the reference counting right.
In machine model code this refcount leak is not particularly
problematic because (unlike devices) machines will never be
created on demand via QMP, and they are never destroyed.
But in any case let's use the new sysbus_init_child_obj() instead
to get the reference counting here right.

?

thanks
-- PMM
