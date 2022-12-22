Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp195263ejb;
        Thu, 22 Dec 2022 00:31:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu37EmHgpz6Wf77M+DIjpUwO5OC0nahKi/odE+I6RZlePv4FXvvHHANF4tgyDgf7pIGsGRT
X-Received: by 2002:ac8:6686:0:b0:3a9:80b6:4c9b with SMTP id d6-20020ac86686000000b003a980b64c9bmr5990269qtp.62.1671697887559;
        Thu, 22 Dec 2022 00:31:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671697887; cv=none;
        d=google.com; s=arc-20160816;
        b=SoY2FZjP5L9sNQIMhvJGtEJOOiUG09oDNNUUu4Wlwm2GR0WuwzNlWOrhG8lmdBtaNP
         2y9HwDNCPoZQE2XMpYp8EDucx+yrTTKERDDTMWUcshpLuxNXqDC+P/2PT8JtvPYcGEhC
         6qBxWpL3HAevC7D1ZNTHsqgM/1QP+/EPbgTDCm5w2u3BqcPGCQTMo0z3DhmGAodYrc0H
         zRYRjTQjX7d7EbhCcfXF8/j7WLK8rvu60c4l7hhwiQH6j8CgymRyPeNmrXVg+H/V4tCd
         n+E7n4KHnD3ZmBb5v3QyLCgF0faVitTC3Vqbzqz9dg5IbihoJ5vNQdhv7DNUQIoXDWz0
         8WxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=hBntXpQKiHmyRRY/EvZRrXzwxIfYGLT31T7/6K1MQqCfzHlTdZKwhlqP9V5ep/OjFI
         bhI1m5P/P9CqJeIWAKXXUdkmF54dsy66KNzdd2J9NNVr972HW9Wj4GeiudfDSS8Yk1kn
         eJrp2vWZlCYxml5OBjB96+r1i7fjOpKJz6OBKP7IcwdY1N6MSPuITQig36omhgIgxYM6
         PcBbeTAsSyKPQFekmjpmTOvTKVhBk0KZlIduKAXVPkKbIyu8ZlZG4ECgt6moURpBmNvP
         FxwRA4vCP4/fhURGqH5ccx3hDM8DI8r4yNgj/QUxCNT5oGN/29CHDayg+e7mdIQsr35x
         vkfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcEt2V9I;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bw13-20020a05622a098d00b003a6a5866c2esi41119qtb.171.2022.12.22.00.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 00:31:27 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcEt2V9I;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671697887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=EcEt2V9IWqSW9KWazMP9lfKxhHWsPxnjnM4gGoADnwBaSaCQ2cX3NfI4wuIVOae+KL9UbL
	BrKnCoVQkqdcDBIUovWQXxk6vuHv2XY9KBjigIjuefW4JIY3pMeM/V5rvWuW9eLohIvvrQ
	biRCBMTSKXMZs1oA9HDFa7sG2IJg/r4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-wz_5vN78PPCAa19lxuhlZA-1; Thu, 22 Dec 2022 03:31:23 -0500
X-MC-Unique: wz_5vN78PPCAa19lxuhlZA-1
Received: by mail-ej1-f71.google.com with SMTP id hr34-20020a1709073fa200b0083a60c1d7abso986321ejc.13
        for <alex.bennee@linaro.org>; Thu, 22 Dec 2022 00:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=kP1us9AZ448oeCojWkCKrbp7+4XRbWicw03MdrVAF9c/e0kB/uOs09LC7ly3e9Iy3D
         kEC42S6xDQXQe/jvWlQ6WejJgd9ndR76mPXV6Jjl6C21TBpsuIH7r1fkvdIxxJV2Vew0
         MbNRww2+sJkopwSLho96pJpTywvJtTh5R/wiS44sTKqNIKxBQ/z5RsMNC0E9LegzI5b4
         LlQMzd5ZHHMrTz7XKVFcrC1GC3AOnPWrDI65HbSfhHy8bKOprvNH58G6gwCMQGFNCEAU
         h1kLftWJgBut9WOmcjyrWFyVfZUCaqTn4zAg8A/BsyGuBQzC6MWTANucGbhr8D7wJVXm
         Mq9g==
X-Gm-Message-State: AFqh2krWf19elIU69MJMD1blSsEDBu+AeMl1kyEGCk+C+/BiHY6YKny1
	Ns9dI1LlJRRLw/oQXLWbPi4hMswqfCWST90GULRI9FIymNajBFCERSi47PcnJiJ/ejZSgBlvvA2
	jUktwl845CavuK8nH
X-Received: by 2002:a05:6402:1592:b0:462:7b87:c6d with SMTP id c18-20020a056402159200b004627b870c6dmr4000364edv.2.1671697882819;
        Thu, 22 Dec 2022 00:31:22 -0800 (PST)
X-Received: by 2002:a05:6402:1592:b0:462:7b87:c6d with SMTP id c18-20020a056402159200b004627b870c6dmr4000340edv.2.1671697882646;
        Thu, 22 Dec 2022 00:31:22 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906244100b007b2a58e31dasm8256467ejb.145.2022.12.22.00.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 00:31:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/6] enforce use of G_GNUC_PRINTF annotations
Date: Thu, 22 Dec 2022 09:31:19 +0100
Message-Id: <20221222083119.860606-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: ysRMEe+xP1hp

Queued, thanks.

Paolo
