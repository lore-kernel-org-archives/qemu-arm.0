Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3207655lff;
        Sun, 15 Dec 2019 01:51:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+8RMArF/P5j92CvIqWhwrs3aMzdowe6A0pAlQh13Sxje4QvVaBGPkkP8cSeQXGPMxs85o
X-Received: by 2002:a05:6830:1c85:: with SMTP id v5mr21099388otf.35.1576403515062;
        Sun, 15 Dec 2019 01:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576403515; cv=none;
        d=google.com; s=arc-20160816;
        b=AqtuZeohZNC9aHx81ph5Eql+j0ZwYdmhTL4gZ5DeFEdiMW0AKr+OUbhCxE01cZpC1A
         nx/SH61evD3ZGjrwfOkVoQpQWHaxeNL5aldzd6WDVnX1cAt0eVqlUblZtyQQNeAgKQcq
         4jvfeQ1WYO68RqXhkviUCJ1g7VcCtxVM964KksGquvwEZX8mq74+gP8XgR/IxaFXNB1U
         XabLh2r7TQ3v6gE6aVQOexiYU7DNyZnrl6s5sYjJw9BOZDVtq5CV4qtk8NsBgctOz73e
         FDYujihJ8Rl0wHn2plvv6/MyC3fWBzN64iJ83wwrRpMyNYTnnC/YexPLEcCMokY7VHBt
         4D+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JexjbKDRWd+HP8U/4Z49W6xylkN1jU7Pq3Ic5X0J99U=;
        b=JCr09tjSXOVeX5QMEvH+z+nW0CZILv9W1shOrLsVktDO0okHEBXksg802cUZBcFeES
         PXH1lrmmEGlToQneSd8cOwm9FD0H7fHNCo0WRnpiA4qKPsHVV047YAmoWw6zpPGjkjog
         CUo2YahKBLe5hoqej4l6R2RnLjXYEYVOXXFcfi2rQUtUQW5EA6M7fC6WAYe4oCs7dp2+
         xGavgK8jSHABIKXLmQ0gK1tvdQkoeCcrHfe+SPn9L9AgzrzR44nSdsax5m5LncGjWXgd
         w/acQ6GWuTovDxmTTHE+vOMfP4N7m6kOQ3U98lA11gSomoXMtq0OVBR1hCDoKE/ZVPFk
         y+bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SpklDH62;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w17si9115536otp.185.2019.12.15.01.51.54;
        Sun, 15 Dec 2019 01:51:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SpklDH62;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfLOJvx (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 15 Dec 2019 04:51:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24066 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726231AbfLOJvx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 15 Dec 2019 04:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576403511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JexjbKDRWd+HP8U/4Z49W6xylkN1jU7Pq3Ic5X0J99U=;
        b=SpklDH62mqahdoACizxPwYwej8UDEmwvNgNsNB21sNELAYstPXvFn1lybbVIlSSD7G/0nt
        t6aKwDiviOo9jr630U9UyJ6g4zhUUia2nOPiwPZKlWs2+04t76qWyUquwReuJ7ebD9oeXz
        oqRo2dYqZBzvrqpoWoa9s3w53F4cBWA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-LebLuhWQNw2AKvCLVyE1fg-1; Sun, 15 Dec 2019 04:51:50 -0500
X-MC-Unique: LebLuhWQNw2AKvCLVyE1fg-1
Received: by mail-qk1-f197.google.com with SMTP id n128so2606213qke.19
        for <kvm@vger.kernel.org>; Sun, 15 Dec 2019 01:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JexjbKDRWd+HP8U/4Z49W6xylkN1jU7Pq3Ic5X0J99U=;
        b=Qet0jkHC2ca2CA7f7drjdhQbVahSlCmPujdSVdlLIrRyss7ecoaF9YzS3nmkpzje0b
         Cm6l3H50/fiXE2wiqsROK+Gk2FVhgbIeNlzlFKSR1cK2GgkrIJJUCffP2cxw0GzRlf/s
         NWLiuYlUuhep4Ku1nyOuKe2if3occtzt6/DGVYEWarzif2w3ZacavxfwHneDylHq3Ze8
         haf5bvTcCCM7Oom+dvC1t0z/srmPTyUZHnGgySdSh4RjX3LuuqmkjGNS1k/F1n7XL+cH
         DrmLnRBTpKms+HIlgykJfP2zCqUYWqUof1W1Xoxpv0tiM8+FPfPjtA1shqikKYAuTye8
         +UtQ==
X-Gm-Message-State: APjAAAW0kVnKbqDCfw3KNCN2tSej0kZma0PwUtzSo7EsYxGrr/xhxg59
        rU4ET0Kam1/2LsouJutQ2J/IOSWopuIyPEaQ1+oU1JIoi5NciBIudxLT7dN8wss4A4eMz+rnGFb
        OM9jqG01MQ6o7
X-Received: by 2002:a0c:ea81:: with SMTP id d1mr21924157qvp.138.1576403509985;
        Sun, 15 Dec 2019 01:51:49 -0800 (PST)
X-Received: by 2002:a0c:ea81:: with SMTP id d1mr21924140qvp.138.1576403509804;
        Sun, 15 Dec 2019 01:51:49 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
        by smtp.gmail.com with ESMTPSA id h34sm5557924qtc.62.2019.12.15.01.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 01:51:49 -0800 (PST)
Date:   Sun, 15 Dec 2019 04:51:42 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        kvm-devel <kvm@vger.kernel.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/8] Simplify memory_region_add_subregion_overlap(...,
 priority=0)
Message-ID: <20191215044759-mutt-send-email-mst@kernel.org>
References: <20191214155614.19004-1-philmd@redhat.com>
 <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /PqiSSr7HUnW

On Sat, Dec 14, 2019 at 04:28:08PM +0000, Peter Maydell wrote:
> (It doesn't actually assert that it doesn't
> overlap because we have some legacy uses, notably
> in the x86 PC machines, which do overlap without using
> the right function, which we've never tried to tidy up.)

It's not exactly legacy uses.

To be more exact, the way the non overlap versions
are *used* is to mean "I don't care what happens when they overlap"
as opposed to "will never overlap".

There are lots of regions where guest can make things overlapping
but doesn't, e.g. PCI BARs can be programmed to overlap
almost anything.

What happens on real hardware if you then access one of
the BARs is undefined, but programming itself is harmless.
That's why we can't assert.

-- 
MST
