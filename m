Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1677902lfc;
        Fri, 4 Sep 2020 11:21:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxenZp1wSQcpeDRkngbPhWL9YhYvsl8rnX+r3XDfemkDM2cQqZ63oMUIMaMBdzpo1SMh7bD
X-Received: by 2002:a25:a441:: with SMTP id f59mr11835559ybi.42.1599243699691;
        Fri, 04 Sep 2020 11:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599243699; cv=none;
        d=google.com; s=arc-20160816;
        b=MdkTwfCt1wAjS5kZbeoUaYPzyYSTHMQMept83QWT1ZNyx0iuKnjO5b+6A2j47pumM7
         DfEm4Bwigyo/BtHXkalcA83qVF+XH8aaPg289fZos5ETjGbvGbumAGKhry+BuEe+CtAE
         5Jz82bLFlYM71dlAHcUWJ3I8EmIheXbcjtXrF+w2R6KhVwQ07UZCg34LKyTvMT7f4Zcj
         v64w7W/HBx7lo4MzSeXvLP+IK0GuX+POedNQP0ADx5hF6SClGYhAd3UpwUExa+1FZpNr
         h5hTfBXXgta5lcm7Ex+tSeSWNwOsQkdefCXYrUrHB/q8X2CVanEz+KELhci/T3H9gDEt
         +eJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=cIjWVwWvOUkifggHK6dGctDQFkg9TU6ogza8cNMQC7Y=;
        b=ugpKBGXh71jtFLYulk7XKM/l22PqNopG3TTaatg+ygWPdH2TUN4km+QSdWM19X2RB5
         wh3u3j3WQ7sj58fflgb0VnxBx33ZhtMoCa/o25NR1kGNX5b5d2lO6TCEuGbKJ8bfVPBJ
         J5LJ1hvxbCFx/3onrrlqRBsj4DCvA6zGpL0VJsvS505OL2TnDfHN6xIuAvx1J3KRIaLn
         FKGXq/0Gt9UfPtFrZT4tfSE0mfeVjH763w0X1+1MewS8ffRVf2hI5zD8+B53dfcKJA4U
         7hrvNDex5aH2w1a2AkF3n5Qsw5VvdTC0bopjsDsDqfOby8xHQgjCF5dUjCsR5w/hAl3U
         jIxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Fs7OYbIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si6972649ybn.496.2020.09.04.11.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 11:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Fs7OYbIU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEGLD-0008Do-3u
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 14:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kEGL2-0008DJ-BI
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 14:21:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58483
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kEGL0-0003b7-6a
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 14:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599243684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cIjWVwWvOUkifggHK6dGctDQFkg9TU6ogza8cNMQC7Y=;
 b=Fs7OYbIU7ezUQMjORd7OM/qqLtN9re0vEIhKIH9Wpe+K8rfcQd5BVU7yIb6BAddVlaELCc
 C4iSr0lWJ62mKgn8bT4+09C/qA2XVlrC7BwUHbwocFTlOyZZQTwjb73xGhzPvx8wTEjF06
 N8+h6qq1dM7Ptqu4gx35Nc12arlaqBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-WV4kQxqsN0yz6y3EH1XC7A-1; Fri, 04 Sep 2020 14:21:22 -0400
X-MC-Unique: WV4kQxqsN0yz6y3EH1XC7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 324171074650;
 Fri,  4 Sep 2020 18:21:21 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE9BF60BF1;
 Fri,  4 Sep 2020 18:21:11 +0000 (UTC)
Date: Fri, 4 Sep 2020 14:21:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] qom: Use typedefs instead of struct names on
 instance_size/class_size
Message-ID: <20200904182111.GD1618070@habkost.net>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200824215936.2961951-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p1JpOSLmqBmi

On Mon, Aug 24, 2020 at 05:59:30PM -0400, Eduardo Habkost wrote:
> This changes existing QOM boilerplate to use existing typedef
> names when setting instance_size and class_size on TypeInfo
> variables.  This makes the code more consistent and will make
> future conversion to QOM type declaration macros easier.

I'm queueing this series, as I consider the patches trivial
cleanups.

-- 
Eduardo

