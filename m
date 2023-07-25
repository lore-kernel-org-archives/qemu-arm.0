Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp18717ejb;
        Tue, 25 Jul 2023 11:22:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFVLn5Nmw6uMLnclvHbVv92sXzNH0uQdg7hw81QMJUM0/SffE1eX7IBSq1B3EDQTai8GFyw
X-Received: by 2002:a05:6214:1091:b0:63c:f630:8bba with SMTP id o17-20020a056214109100b0063cf6308bbamr3058365qvr.53.1690309332934;
        Tue, 25 Jul 2023 11:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690309332; cv=none;
        d=google.com; s=arc-20160816;
        b=vzaiHESxCTZMaxOatsraOufWdYbzI7YgEZqmYgd3FLwR8rwMPGS7ag/FM8fWvNg3FL
         SsH/yzu5CxuKNmUlgouXBdmNUfOVz45zixYiVUgVfhkbkDGnLhjkHLntBUfl9mjp6E+2
         LyWpejGUUjbqfJqP8WlQRIMyE0i7NF3Xp0zanvaZi0ce0mvMNMhrd+45zURx8GhIV+Ex
         VcxlJ3c2q1eYM9UA3jN3mVy/b/9JCQit6WHT2KmerJl2h571tYS0Tr2i5skJTG6ySqNk
         hm/9ZW2CAMvAqmkOiE9EzdRQRuiQlFmbFrFsnb+9UmnCaKjynlAtzAmReFqaQ7YvO17D
         RRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=985G+BIcbgwMIi9jyA1lUHdDBc/4m9ojIi+tw3nvuZU=;
        fh=zLQERmDA5TGOuXtIamHC2vUF6ncw0A4+dsMvQHS1arc=;
        b=OG2QAyoVbVaA6xYKl9iGoVAKTcmFGUAHsByOMcurBxesSHl8k+NxmQO8ixTA33mOsJ
         tU7mVqtAInk/LJvdj6DN+wpUH7hh7M3m3I9kGXqkF7TJonZajq/qY4ZF2M48BdJ2gXml
         oXk49sCHenXk7+RBPmGxqT1YVJtPzdQS+bA04zZnkXGgqiv0brU2E827y3e92cdM/LBX
         wIc3LTUwMH0PW0d1VNYnGMK2UtAU7KmeSiJ8uHRu6KWWFGoZ6lr/Rn1g/xwIBYZLgpcG
         p/zIfnlhDEoNGZ55b2D02kKWwdzV/ndhWmfndI++lNQjYNr6hX43cVFD0lI1QQrT5Xv5
         bntg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UTyFSkPg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v185-20020a3793c2000000b00767c61eeab6si6550518qkd.115.2023.07.25.11.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UTyFSkPg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMfB-0007JY-1Q; Tue, 25 Jul 2023 14:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMf9-0007J6-8q
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:21:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMf7-0004kh-AB
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690309292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=985G+BIcbgwMIi9jyA1lUHdDBc/4m9ojIi+tw3nvuZU=;
 b=UTyFSkPghu2OOzr6Iup3TDTxV+CbGkowiLgbvJkk67Iy45pazK0N7a/3gfh0INktUbSNEV
 /IosJrd3wYYmUyzlxC/m4Gm0LawwYf1TGmj9xvMV6WBzrmjknNUfe9MiiwGcPUTKB4m9zZ
 2+NOuIQCKvx6cqSXPxCkiDa4nXOlLTw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-Z-joWymVNMuPKO9RIH_7Nw-1; Tue, 25 Jul 2023 14:21:31 -0400
X-MC-Unique: Z-joWymVNMuPKO9RIH_7Nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3640D3C0FC8C;
 Tue, 25 Jul 2023 18:21:30 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4906F40C206F;
 Tue, 25 Jul 2023 18:21:28 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:21:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/6] python/machine: use socketpair() for console
 connections
Message-ID: <ZMASpsH8/S5UQTGo@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-5-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725180337.2937292-5-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Wc8TfptQvqTo

On Tue, Jul 25, 2023 at 02:03:35PM -0400, John Snow wrote:
> Create a socketpair for the console output. This should help eliminate
> race conditions around console text early in the boot process that might
> otherwise have been dropped on the floor before being able to connect to
> QEMU under "server,nowait".
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

