Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp74655njc;
        Wed, 19 Mar 2025 01:29:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6QuV4f6cfcfchHy8DkB1CDuhobIutiyp/hTkFLHvHCVD2xrnfn+MFE5rCdFVjizyhxCWbTzYaylNhwA==@linaro.org
X-Google-Smtp-Source: AGHT+IGbw9DK8NSeuFb0YwV0KaufnRUl/WR8IuRKmsIEOnol6Ik2YRorzptQF5NN6TsoU5Du0jQd
X-Received: by 2002:a05:6214:e83:b0:6e8:c713:31fa with SMTP id 6a1803df08f44-6eb2926b011mr30208396d6.9.1742372984609;
        Wed, 19 Mar 2025 01:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742372984; cv=none;
        d=google.com; s=arc-20240605;
        b=TJjQCw+x1eb2p3HD38Pptq4uX57UJYm+lQ8cOsy+nab5xQOm7Uopa68CI81QEhyY9U
         CB1jizElmTNUc6FNx3JSQZ0yF4oSj8Be0GoA9I7rIwzLLeZsQZ9jRoT1+Ep+Ut4qThv8
         i7aZM+Fvk5lbYVm/raLQ+2+iCFH788zQ1oZfEzocYEWLe//2NDetm+/H60wFiBw07it5
         ll9iWISVszn58TRrA59PSDO/425Jkkzx0ZPOajLiHqu8iJQm2F3zW2ft5BHo5TfvwQ3/
         FKD8Ak0TQQ196zQn1CjKzW9LWIP7iK/JMUPoxP71VJy8ZGhSsVeUqFsOn4mHjdAPO8gV
         L9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=/bJ6MbFwN+di6JVTLn1fhmV28rnHIqOgYBZ2FBtGYb8=;
        fh=nP2nYgZlIHJLpEyb/sHgorKtY0QbyJHrgBNsdlt4iy8=;
        b=VGRFPoHdYgCqvaYjc7i8Eimcfasi3RgKdJ353D/x0lx8BQJcErYTrUS0coqA0+NINr
         mt4Xc3ipzlCKTS2df4onJH5W4d97rDM9Ox4ZtS63DwxnHTyK5D0cyhItFDvaeLc8LmwC
         DbTvqnPiov4kVMdpA33p+hHmaPcgBq5cy7XNSNzDvLP3vD3V7y+EVy6WLmxTjmgr1kG7
         px+7Fs9c/mvqcmssOspBLcQshegvMBZddczhl1qj7T0kwGa4DdcFEM0N+Mh+1LmppcrI
         /qIfdaADRTIh6nSELQw8uf9h0j+Xu6o+ugQ2FZm9e3e5or4Tr8VNmlkBMhgStY/rx38X
         0ZMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fe07paV5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade33caaasi137014466d6.233.2025.03.19.01.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 01:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fe07paV5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuono-0003IH-Vt; Wed, 19 Mar 2025 04:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tuonk-0003H3-01
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 04:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tuond-0008OE-Hw
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 04:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742372954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/bJ6MbFwN+di6JVTLn1fhmV28rnHIqOgYBZ2FBtGYb8=;
 b=Fe07paV5v1bDZTsDoXo5MB5a40Kytvo3Qp/WdNB3Gcgi6tY9XR3IRbEuYmGF5mKll7Yi5x
 pkDukFKj/ZimP8nwgh0+/W3RGanTXbxzXYvvqfeyOyi9jhwwHXT40JLfXG6FUsg8eJ5IVR
 k/+CZ4mgvsyrADTa9DBmGo8wxfqR2R8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-RwIdvYrCN0yCUePFZyJBgQ-1; Wed,
 19 Mar 2025 04:29:11 -0400
X-MC-Unique: RwIdvYrCN0yCUePFZyJBgQ-1
X-Mimecast-MFC-AGG-ID: RwIdvYrCN0yCUePFZyJBgQ_1742372950
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F30A71956064; Wed, 19 Mar 2025 08:29:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.38])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0E00F1955BE1; Wed, 19 Mar 2025 08:29:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91F8818000AF; Wed, 19 Mar 2025 09:29:04 +0100 (CET)
Date: Wed, 19 Mar 2025 09:29:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PULL 14/24] hw/uefi: add var-service-json.c + qapi for NV vars.
Message-ID: <wcpg5idrxwq6fntknc4vubnzaeqqqgqbpo5rdiqhumk745hsu5@tofolnd6v4dt>
References: <20250304124815.591749-1-kraxel@redhat.com>
 <20250304124815.591749-15-kraxel@redhat.com>
 <CAFEAcA9_rb321OBOfv9v84ZLO7aw_8t8pTDMUYxj2SNnSBfRmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9_rb321OBOfv9v84ZLO7aw_8t8pTDMUYxj2SNnSBfRmg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oteRv8hsgizi

  Hi,

> Hi; Coverity points out some problems in this code
> (CID 1593154, 1593157):

I'll send fixes later today.

> Do we absolutely need to be operating on a continuously open
> filedescriptor here rather than a filename? If we could make
> these functions use uv->jsonfile each time then we could use
> the glib functions g_file_get_contents() and
> g_file_set_contents(), which get all the pesky details of the
> error handling right for you.

qemu_create() works only once in case libvirt hands us a
file handle instead of a filename.

take care,
  Gerd

