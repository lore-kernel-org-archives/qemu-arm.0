Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6800304lfk;
        Mon, 22 Nov 2021 03:34:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrJscx5IE2CZWstY6ebMZzPqEt+sfrlpe9tR8H+h0zQqYwNad1BSAaHyojcynViz+L/1DF
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr160552403vko.7.1637580843971;
        Mon, 22 Nov 2021 03:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637580843; cv=none;
        d=google.com; s=arc-20160816;
        b=gSjReHJR7Ji+r5B6glCJhscIu9UF24IGUy+4lYAtVfWOzKvJykwrgTP9kmPXAWfnG4
         pDhjdYb2AvsFbfYN5nUmSu2kp9eTsUk1/ufNzplSVoGUcplibcICtGAa82jkEfuhQvhO
         WArVZyFv2ab9qA30dMDDGBThwwrDV1XJU7CvGvgXl03JBNsQThW/loCF/VQG1uaOrzAb
         o1CA3N48dBpPqyVMmbFIrrZumIqwBNRoIn/BO7EV2DuchRtCWzt4XTPnH3VmItLIWgDO
         oThDlq0lcT844PWOuXTHCG36/GehnI8Jtl8OiaKK/ZAKFOBihKBLH1Q9rBVL0ulvy9ss
         W3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=uCAo8tNBYqjYbYU5JkoqonFteLnbw1SpFiI/f2ieGLc=;
        b=tkaJDZp9893WsdPKRtN7Hnb+Dybtw3IEBvHuHD4hpPxWmJgMhmW9WCfHt9dmoCa80t
         dE71bNMeCzDVI1UA1FWSMMk8ASFaZlqsXXmVoUSqTWksJMbQixmbsrvUNkSN+Kmw/L1j
         LmjM+JFZqMVwBknPzfTK5BJhGnC3jozGGkFaAIp2+n9UZh6ggqG9oAQN5Al81wl1rDnG
         D5t95hp+oWmBjFWDyvZfI36i5GjvSoX0FR3oBTHZWAGgb+p+n+KXia7mIw3EbWXYwwRr
         rz86qLctNnJmyVNKK6Kb4/0Lt4riOvaD5CzQ+iwU5WYjrxwVygxNc5TuPnep7C0utOEj
         j92A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhO+zw9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si21302731uaw.199.2021.11.22.03.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Nov 2021 03:34:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhO+zw9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mp7aF-00051M-BZ
	for alex.bennee@linaro.org; Mon, 22 Nov 2021 06:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp7a3-000502-0N
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 06:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp7a1-0006pa-8H
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 06:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637580827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCAo8tNBYqjYbYU5JkoqonFteLnbw1SpFiI/f2ieGLc=;
 b=RhO+zw9iaiKxz8R9fFNPzoa0GuGWmz98DvUJFBeMV3p+s1pR0nDOX6JwUMRLxn236dEOfQ
 xgcaC58BEpE9nJ1oUWVpa7EMbl35mTQYTODNILWgJi/KDvA+dRARJqY9SCu5rVuoQ7iQaJ
 nQSXFBogGEXkiNxF0MCdODBgJEa+30c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-v9oPsqZUNpaX0kduzPgmMA-1; Mon, 22 Nov 2021 06:33:46 -0500
X-MC-Unique: v9oPsqZUNpaX0kduzPgmMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5F218799EC;
 Mon, 22 Nov 2021 11:33:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF02B5E274;
 Mon, 22 Nov 2021 11:33:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 95EF1180039D; Mon, 22 Nov 2021 10:08:15 +0100 (CET)
Date: Mon, 22 Nov 2021 10:08:15 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 3/3] hw/i386: expose a "smbios-entry-point-type" PC
 machine property
Message-ID: <20211122090815.2vjsh4vrp7cvqi7g@sirius.home.kraxel.org>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-4-ehabkost@redhat.com>
 <a2618cf2-a2a6-53f6-a7f0-8bb3a72d32e9@redhat.com>
 <20211102072349-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211102072349-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u1EswKbytqkK

On Tue, Nov 02, 2021 at 07:25:25AM -0400, Michael S. Tsirkin wrote:
> On Tue, Nov 02, 2021 at 09:51:35AM +0100, Philippe Mathieu-Daudé wrote:
> > On 10/26/21 17:11, Eduardo Habkost wrote:
> > > The i440fx and Q35 machine types are both hardcoded to use the
> > > legacy SMBIOS 2.1 (32-bit) entry point. This is a sensible
> > > conservative choice because SeaBIOS only supports SMBIOS 2.1
> > > 
> > > EDK2, however, can also support SMBIOS 3.0 (64-bit) entry points,
> > > and QEMU already uses this on the ARM virt machine type.
> > > 
> > > This adds a property to allow the choice of SMBIOS entry point
> > > versions For example to opt in to 64-bit SMBIOS entry point:
> > > 
> > >    $QEMU -machine q35,smbios-entry-point-type=64
> > 
> > It would be nice to have a test for this...
> > 
> > Otherwise,
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Can we update seabios and the switch the default?

seabios support is unfortunately not yet merged upstream.

> Maybe just for q35?
> Or are there more considerations?

It's a guest-visible change, so IMHO we need the runtime switch anyway
so old machine types can continue to use the smbios 2.x entry point.

We'll switch the default at some point for sure, but I don't think
that'll happen for the 6.2 machine type.  We are simply too late.

take care,
  Gerd

