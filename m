Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1089644ejy;
        Thu, 2 May 2024 04:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWATkd4xGyyB61wYLoWNyywfDGQWpFzZQ4z7UqUZWIDhc8bGi/DERFl5SLCNae+OmrY0SNSwhBwaFhYSqKwOtJm71qPzmIR
X-Google-Smtp-Source: AGHT+IEigSTu0dCML6X/kgOAvPRra9omvWcfNMiXyb2Alzxi7IzTUI+h3ypQAjIErhljB2aU7UKL
X-Received: by 2002:ac8:5d0e:0:b0:43c:60ba:81ab with SMTP id f14-20020ac85d0e000000b0043c60ba81abmr6637579qtx.28.1714648419408;
        Thu, 02 May 2024 04:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714648419; cv=none;
        d=google.com; s=arc-20160816;
        b=cn0Y/jkPcbRaWJrR1wC88pId2YevC5tb8lXE20kuKCIELw+ueJrF1qtzkSgt1SuWu7
         VZ0dDWdB99PEx/MvhPlgfgQZwXOAEC4sg5jrmlGJ0PDtGdwZLPys99JZamKNaJ5SwexW
         X4fsxVoJcN4COKO4iYRrtCz/PUPvTXnbocsM/AF+FZ0dQZFUB2aGc0WR0ljLQmflZDqH
         UVPSsChQ63DwVhzEumhzDdy1/3FcwuX50nlxT7w5dyp8wWtm2rosWoUcHwrqo8zmceOQ
         BKM/HJtlryXMLEH2iZQKcK/RbjpEmnNElBGvrUo6/YTj9R/b/ZvU2fGHBITGTx9ZQDHm
         kPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ReHaOmtWkCTZ24YOjUrIFzDhCHIV1mhDRW5EQbEV5Gs=;
        fh=Ms16QcKpU70eAate/Hw38VHfo2hdtf7uGlCRNNJz0FA=;
        b=QcHOYsYehmAv2f90Cc/dIkBpHsIkNt1Z1tgEo9NBRuhk0wrncD4ylSbVR3tmCpLy+a
         fFyT+LPxmcjrwPM7eO7hhz3xE1hSEaB4aBSwCosnFZUNOTo6TOrP/H++EPTU52ezn5Eg
         lVrq9jMs2ROMRkdg/GgGDl5iLykQCcgOXBmYWPUbVK7R/UFYpcfgwDkwU0sOaP39XqHO
         4v/IorXD3aCT3ELpCWSPxN4/ou2wrNrgLW4XhdU5fH40sHWI7R38dHAJY1LtBHovFVGJ
         eTQ/0FfhELeAr3iwz/4VnCZKPio+q90xk/k4LX70sQhuxllT390WTLWoJHkxaKqvJrSI
         dlBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fB6dZ91A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19-20020a05622a04d300b00437a0620a47si699841qtx.566.2024.05.02.04.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 04:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fB6dZ91A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2UNO-0001li-UT; Thu, 02 May 2024 07:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2UNN-0001kr-O5
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2UNJ-0005sZ-1v
 for qemu-arm@nongnu.org; Thu, 02 May 2024 07:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714648395;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReHaOmtWkCTZ24YOjUrIFzDhCHIV1mhDRW5EQbEV5Gs=;
 b=fB6dZ91ANqt+8Ol7q7V6NzqL8kbs+GGDGs8CW25SVor/lCapl1rj37NgO0WuK7ey4CeubO
 SLakQVZjqD21Ow+rm2GTKPGcVX91JUuzU+hUO+9q/7yi8g+n1hJ7FG7xc6Z2heMzmznkRK
 dfIg12FminDtKH53e2dkKhiY7UIEkYc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-TFpbQAWgOiiiWtx94Bj1RA-1; Thu,
 02 May 2024 07:13:12 -0400
X-MC-Unique: TFpbQAWgOiiiWtx94Bj1RA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39B8F299E74B;
 Thu,  2 May 2024 11:13:11 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFB21EC682;
 Thu,  2 May 2024 11:13:07 +0000 (UTC)
Date: Thu, 2 May 2024 12:13:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 09/14] hw: temporarily disable deletion of versioned
 machine types
Message-ID: <ZjN1QSZMhsc_S_6Z@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-10-berrange@redhat.com>
 <48986ad1-ae23-4ff1-9494-cae9b485deae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48986ad1-ae23-4ff1-9494-cae9b485deae@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fZktjhAJrqQi

On Thu, May 02, 2024 at 01:05:20PM +0200, Thomas Huth wrote:
> On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> > The new deprecation and deletion policy for versioned machine types is
> > being introduced in QEMU 9.1.0.
> > 
> > Under the new policy a number of old machine types (any prior to 2.12)
> > would be liable for immediate deletion which would be a violation of our
> > historical deprecation and removal policy
> > 
> > Thus automatic deletions (by skipping QOM registration) are temporarily
> > gated on existance of the env variable "QEMU_DELETE_MACHINES" / QEMU
> > version number >= 10.1.0. This allows opt-in testing of the automatic
> > deletion logic, while activating it fully in QEMU >= 10.1.0.
> 
> If we include your patches now, the old machine types will be marked as
> deprecated in QEMU 9.1 and 9.2, so it should be OK to remove them in 10.0
> already, shouldn't it?

Yes, the deprecation marking still happens on the correct documented
schedule. We're merely postponing the removal to be nice.

IOW, when 10.0 arrives, we'll be able to delete everything upto and
including version 4.0, so at that point 4.1 will be the oldest
machine present.

Without this patch, we would be removing everything upto and including
3.1 straight away with no prior warning. With this patch everything
is still present, under the old deprecation 2 release policy.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

