Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp318825lfc;
        Wed, 2 Sep 2020 00:59:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydvKTdVcbPgVZoFPoUe3/LMtsAbjIZaIi6UBaULU/4PRhRfixjL/8TS0HhOGrn82p37y2H
X-Received: by 2002:a25:70c6:: with SMTP id l189mr8390046ybc.263.1599033575420;
        Wed, 02 Sep 2020 00:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599033575; cv=none;
        d=google.com; s=arc-20160816;
        b=wbxNe8WYzEWGW5EhKOCoeAWZjyTpP9JFd6J7HGLHahQ7pVbbFCRciJmGIKAYlQ+qHi
         Kaj0TFC8M46uHBCcaW0R7EuRDga8Svy0kzxmfYYlA9mM55deDGCPxqpCM2CVtVTG5Dpa
         Ps50ysnfvm0QUFLDCDfFDABgKczuc2lDs53PuBQ8E0DJUVY372p7xzPSCY/Rv9tfL9Ee
         F/h3hHPf4oF8JgYA8//pzQ+LBlvrrK6+qY7DjOAcLtj0MPo0GOWtcRCJyNOVOrOXRjkx
         lIYbmG7uak+a3v5vWXT+4lPSvPNqqeSQPJW1msf55AQBNnHew+seqyT8cw2qJ8zbhSeL
         GRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=YV3NQUQAY0GZvYY7CxxjxslcuZmbu0ufWYt10L2O9Mc=;
        b=Hi0h8VrTxLlrZfj3NZwG/2x0MN61bx9tIaYI24bkifkrNG5ys8gwH3/v31mkRbqovT
         72CvRteiJ68Di+FEqQiMc/n2bbMpGoZehT6sWire2mIMGmEcizyclcFiF+bF+CX5dctV
         POYaRLzUFB6ixRo7SODPfdO1E3x5C8kXk8AJAMOrwiWDae8Q348JwE6Jf6LDRoFMt4ZL
         qlNoGy5wuj3EdXR5RcFqXQvVynwwNaul/Zn+3nXH/MRYzO8KqBN7eBcNqTwJmXP/RE63
         ErkO3frGMb8e96veck9NWWlLBF48gYd8cLE5ioDbQ5OZK7OitLvVVVyg4nGjGsXSv2hQ
         ZNYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WtzuZ0yU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si3263886ybk.249.2020.09.02.00.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 00:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WtzuZ0yU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDNg6-0008JF-Q6
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 03:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kDNfy-0008Hl-GU
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 03:59:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55730
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kDNfx-0000VH-2a
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 03:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599033564;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YV3NQUQAY0GZvYY7CxxjxslcuZmbu0ufWYt10L2O9Mc=;
 b=WtzuZ0yUcdQsfGzpCvGvqmGC5ocp3N5uXkkJZ6ZuNopkxq+9jA3Fi9bIrhl7TZNyhtbEtP
 5qfV0Ew7+PgPYzzRdWdbr3Qnbrv00nayhWWkeTT6ftG/Ea08oPFldOQ2S7ZkyVHYYJyDmf
 OFG7g6I36AwZMDvOmVNekHjHUHRRXDA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-cheCZBAWOSOE6EBObhUwaA-1; Wed, 02 Sep 2020 03:59:20 -0400
X-MC-Unique: cheCZBAWOSOE6EBObhUwaA-1
Received: by mail-wm1-f72.google.com with SMTP id w3so1522902wmg.4
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 00:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YV3NQUQAY0GZvYY7CxxjxslcuZmbu0ufWYt10L2O9Mc=;
 b=hc1y3ALvlGOuexvu6QLs1xxeVWri41FG5wI4XxQeufZzw4/Nj+yiqNSgORBT0WxUAC
 UhzlKzDNtQMr6KL3hCcVhhGpgougjp8Muqvz+QXiHU2A3LwzfzOq/Q6rXW0HgzJ6Vw0t
 Mr1/3BxUeeWZIfdpLo774GLD5LKVsPVRUCOpulwNTXYaFQN3enG7AyGOWCk7l99Jz1pe
 p5cvl0A82UVGDVd3O64ePNqfTJ8N+sKoNiIXuE19teIIP+gJ6LM1Jm4m+DxVFB5tH8Kn
 LO6tJROKtjB1Uyjk8mvhPzEJzg/tYVJCiwNsPzSe3kccIf9XBSsZ/cGNLg97yorCe6Fv
 LG1A==
X-Gm-Message-State: AOAM531lOPts6XdNmN2BnvNAbAJts3FKsF8cu9gNcWTYZtcWvzdtjoCO
 K3unJYO3uB4/E1PptzhTOfWA3gvA3RfQ+pDENBMZHRh9wu5Yqc4iHHIzqqX4HRiZm8ORs565D2Z
 o2D08yRyjsrEg
X-Received: by 2002:a05:6000:ce:: with SMTP id
 q14mr5773085wrx.112.1599033559791; 
 Wed, 02 Sep 2020 00:59:19 -0700 (PDT)
X-Received: by 2002:a05:6000:ce:: with SMTP id
 q14mr5773056wrx.112.1599033559614; 
 Wed, 02 Sep 2020 00:59:19 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id e18sm6660832wra.36.2020.09.02.00.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 00:59:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v8 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
In-Reply-To: <20200901142608.24481-6-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Tue, 1 Sep 2020 16:26:08 +0200")
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-6-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 02 Sep 2020 09:59:18 +0200
Message-ID: <871rjkr4mh.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:33:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pXnFIsbkrU9K

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

