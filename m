Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2324061njb;
        Tue, 15 Oct 2024 02:28:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXa25T1dhzB6D4r+W+2sN3y0CEzJPS+OK/GIBh9L9aeKt1VFgMsiaqJL81lS3tvGXKQsFx/HfClvD1rIg==@linaro.org
X-Google-Smtp-Source: AGHT+IEaDCmKBAn4nDUSjEyTekno2xblzpfZwFAX1vgtxkQkeyci/DMyDdG3Ho1ZtCQ5NI17choC
X-Received: by 2002:a05:620a:1a1c:b0:7a9:abdf:f517 with SMTP id af79cd13be357-7b112517be8mr2662393385a.25.1728984487013;
        Tue, 15 Oct 2024 02:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728984486; cv=none;
        d=google.com; s=arc-20240605;
        b=k+xonnxj6CE01t7BBJMOutX88e50pQybC3ANxHC7r//1k601kaSc9Swnn2CpIA21Nb
         X81fmyD82Axb5Gw4CILw8NpI5wn6j8ALFVvfY1BI3QiJPjAsVQ7/mJBIKAUqvwyrZ5ZS
         UIorIr6XUiVDUIwCfkpGdGBBqY8PHEM9f/WgfwE9RQIMdzvU0i+9F/BZr5HBsfoqGGHh
         ucFVpHCvZ4hKbEF69mfxkqboizxnlLEM0w5i2YrQaQ5nJHjz+BPAWXZFRPIoleD/OG7K
         K5vxJvaGHH0Nkq+SqTqCUYR2G6m7m3E2cDbXDvU4PJROC8mnPpszfprfhWtIHCHEgrof
         TJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tgpPHOMHhB56moS4r7vrLRohooFORWaeNRHN7Bg0Hk0=;
        fh=HIsuUOgpMvgopiD3SRQ473HXMkMzMtZZqycEJsgPHm4=;
        b=HAcI+gF8VP28H8j8XCBMBREceh3w3Lwvpbp8Z7SMGI9lJRzF/vnpVoUGEYL6wRS7Bx
         mOV9cYgsGyeiZJsh86bKvPXqY6HNi6/tZUPHCtoGYSGVorpjUr+ngKyMqjloW54eKQR0
         21jmT6DcCPLH47Q2JIxJFTpgErZMbrpqpWV2ELm4bFsRINys0bkf3JL1NRzQHUFbX1ex
         9mxCvaBvk4wjNs0wGsF25Mpcy8dNIH2VD4l3u/g2nJEBlNM/aBOuJi0tr4ho8lk617ED
         E5KW0OUOkNAravFaEhn5hpjHDePwfxR0xwtPlsQ2m6hvl0yPaoX5hVD/d1LaJtjgmCcw
         c3gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AFBObu/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1363e2f18si97627485a.453.2024.10.15.02.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2024 02:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AFBObu/b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0dqN-0000y2-MH; Tue, 15 Oct 2024 05:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0dqM-0000xm-VA
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 05:27:54 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0dqL-0004qS-CM
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 05:27:54 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso5467446a12.2
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2024 02:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728984471; x=1729589271; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tgpPHOMHhB56moS4r7vrLRohooFORWaeNRHN7Bg0Hk0=;
 b=AFBObu/bpWLJkLiN3b7RH6DT07w8mXbNkU9Wk9VfZC6mkoG59r4kVv9+fN/tiQdEsB
 Rz/1ZaZq4hmlwJRM7GWjjvdp1EUYZrAmKFce/oKaU1/8W1C6++J+MYyOsTVzkSp6A7yk
 ywNu385t7VIz0Ix9nChOWOMM739zG4JZS63qx+uarA/9M8teJ/TyXlcb9sdfjwrylbnZ
 mCPMzzt0hXXc66B+4RY+goVuXqYkgeM+R1BN0uNJrWciL9BhG9we3+nnVkUH46t96or8
 Rsjr2w+x+0D7ZdCl6OpGrXnXZHYdieXwWIfx6X+5igIqsTBqnsqLP70kl1PQy+UAbJ6D
 k4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728984471; x=1729589271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgpPHOMHhB56moS4r7vrLRohooFORWaeNRHN7Bg0Hk0=;
 b=KTQSDEvQC/W3aMaxOoqQfWFYk6kPZnnxSGBiyGr46ZzjW5U8QnDEHt+VkEa53ryYEz
 OK0EFwOqjWDeyLv77LZXbftp59hZMPDz5pTsmGTAbvQlbt/rJD6pyQpWtKaDWxKyYDQ3
 s5MKPNzt/U6b8DMOqc6n4ZQITWHhHmXIb3tERCE8FkNS0edsYqy3poeBBaqFef9BexxM
 JXIIkbAAxzlkoygdY+KFeor+9+VMhUyGTuWnDMj7qn7ZLF6MEAYEDKa5O9N5THTsRLoG
 8MC0kgxH/bmQ9ThlpCVfS9KRDsjY4O6gYGJzlFQ76GxY5/zqQKQCV07JMkG6nXJ+M/vw
 2xAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/gIftFibNKHeTgrS5smFLj/5uAvVyWS46XuzhYqBcIcqiZ2Z7HpmqdpsAEaLvxoZGGEQ0j+rvnQ==@nongnu.org
X-Gm-Message-State: AOJu0YyaJ1jGR/zWpmfNl0KVnjJGDbaX4juXrzbQ9o1R/YtI2Jq93p+J
 1wkLBhEtdg0uX4JGttQeDoN6wsS2miZdE5UFaPjzVMmO3jWLPOEOFSfCKTHAUYKpa3d/QAxONas
 JeGsqHsOtKIFYExnReRQstENTT38Vld5fads4yw==
X-Received: by 2002:a05:6402:2685:b0:5c3:cc7d:c29d with SMTP id
 4fb4d7f45d1cf-5c95ac09825mr7747372a12.6.1728984470867; Tue, 15 Oct 2024
 02:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241005205748.29203-1-shentey@gmail.com>
 <20241005205748.29203-2-shentey@gmail.com>
 <CAFEAcA_2EU8Q+=Zm7pKJpO42=nAeGf9jpCsoM8ped1ngw66gKw@mail.gmail.com>
 <E3D8FB20-605D-4E29-A430-DD3C4B01102D@gmail.com>
In-Reply-To: <E3D8FB20-605D-4E29-A430-DD3C4B01102D@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2024 10:27:40 +0100
Message-ID: <CAFEAcA8cEFprRy-9AbPsGLU4p1DmVepmWCsgY1LkKh26tHo6qw@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/net/lan9118: Extract lan9118_phy
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ie7oLPkJ+T8t

On Mon, 14 Oct 2024 at 19:50, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 14. Oktober 2024 12:47:52 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
> >> +typedef struct Lan9118PhyState {
> >> +    uint32_t status;
> >> +    uint32_t control;
> >> +    uint32_t advertise;
> >> +    uint32_t ints;
> >> +    uint32_t int_mask;
> >> +    IRQState irq;
> >> +    bool link_down;
> >> +} Lan9118PhyState;
> >
> >This takes state that was in a QOM object, and moves it
> >into something that's kind of a device but not a QOM
> >object. I think we should avoid that, because at some
> >point somebody's going to have to QOMify this.
> >
> >Making this a QOM device is a bit awkward for migration
> >compatibility, unfortunately.
>
> Do we care about migration compatibility here? Or is it
> sufficient to check the version? In the latter case I could
> QOMify it.


Doing a quick grep it looks like the lan9118 is only
used in a set of Arm boards and none of them are ones where
we care about migration across versions. So I think we're
ok to break compat with a version-bump. We should mention
the affected boards in the commit message.

-- PMM
