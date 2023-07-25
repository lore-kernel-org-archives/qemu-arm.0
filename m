Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp20272ejb;
        Tue, 25 Jul 2023 11:25:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEICFONGwcGUZzlzn00jHvymdVOGLkk1NyGU133UlOL/lTkCZkN28vf08DTvM7p9J2FbY40
X-Received: by 2002:a05:6830:22f3:b0:6b7:30cc:6419 with SMTP id t19-20020a05683022f300b006b730cc6419mr155834otc.1.1690309507705;
        Tue, 25 Jul 2023 11:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690309507; cv=none;
        d=google.com; s=arc-20160816;
        b=Cyb2hCaf/OPBd4DVhYzR4OMcknbAdaMzOiXmK1I317oAlTL8inMV6QE332nmGZnLo1
         tEUM/UCCyf1cOhg3Maa4UuxFxAWRzHot031GpFAtLIaLUcaVCnKLe2lITLJtmkZnWOgS
         ye6Ui2V6ZlspqfGPnyoQgD8sfftMDIMjst8Md78l7t+yRbIO2acSB+m581LLO64jvk6G
         ktQNUdBSQMGaQYY0eH+HDExFChCuUvpub1HlNQLb+7mxZmO33fj37MxkcBrhiIjiRWXg
         DKoIWFzDcDM5GEki1VvVE/PAXM4m+OaJ7xTBJrP7usLfi82ntjNRmk4hD4qNneDl8mLQ
         SVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pqkPQoPuiB0Bbv80pcJfMXbFH90HQbLGyA+J7sZSuBs=;
        fh=zLQERmDA5TGOuXtIamHC2vUF6ncw0A4+dsMvQHS1arc=;
        b=efwae25f/jMUX1g/ckQaZL8EX+ZZDm1lVla0kD49bpLDdMVpp2HJumzRsANn21w7TQ
         jqvE6d8Bs3/Fp/3pG0pXjHjJxWkiAQe5r03zxztMM7C+D3DTvnE/ANBEb+gXZGuXgJcl
         JB8BFG3m2ZZfrXfNgYLd34+LOgi69kiX+sfDn95nihxF9xxOtd1ohCi31n5ycfNk25fc
         sjMGRIabaRclT8G8VNCTV0mwLmPxfhEZDHOLBuFgBxRJTzZmWYiPrw4NIqsXmd9IH1pv
         DcEgtZcGH0VHTkj+uH8IHO0E55NOc5DoXaa4dS0xCMXfMX6CSRMOH+ZShnU6iwx+STBp
         I+Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PicKqdMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020ac84e4b000000b00403eeb8f219si6961429qtw.753.2023.07.25.11.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PicKqdMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMiH-0000GZ-0R; Tue, 25 Jul 2023 14:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMiE-0000Ef-NY
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMiC-0005QK-4k
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690309483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqkPQoPuiB0Bbv80pcJfMXbFH90HQbLGyA+J7sZSuBs=;
 b=PicKqdMaZop0badsBns30+wsRyBu34BPxeGqaAfVhidN7j+1DRBY+05X7KIAT5//zSRi5B
 vDD7ToaQMid0IIiekkFaW9busnDpcGauGOgi7cFkysqt1/CQTMOX96U2sG2yWwhwTjk9Jo
 0cx/rcR6UNEjNNtRps+Qj1TbH6lZ/PI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-tySqv3HxPeyvBdDbkGjFRQ-1; Tue, 25 Jul 2023 14:24:40 -0400
X-MC-Unique: tySqv3HxPeyvBdDbkGjFRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2DE71C0724C;
 Tue, 25 Jul 2023 18:24:39 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDAB11454151;
 Tue, 25 Jul 2023 18:24:37 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:24:35 +0100
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
Subject: Re: [PATCH v2 5/6] python/machine: use socketpair() for qtest
 connection
Message-ID: <ZMATY1r7aowQeGAC@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-6-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725180337.2937292-6-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fomu5kH9dGsC

On Tue, Jul 25, 2023 at 02:03:36PM -0400, John Snow wrote:
> Like the QMP and console sockets, begin using socketpairs for the qtest
> connection, too. After this patch, we'll be able to remove the vestigial
> sock_dir argument, but that cleanup is best done in its own patch.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/qtest.py | 49 +++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 9 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

