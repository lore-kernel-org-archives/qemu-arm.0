Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp192697ejb;
        Wed, 2 Aug 2023 01:16:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFY8ENCkJBuTtBvH/hP4gGLsxhhgEIghAN4wczS3exF+EVAQr5F+qPfzP7T0c0Me/28+3s3
X-Received: by 2002:a0c:db05:0:b0:636:14d4:445b with SMTP id d5-20020a0cdb05000000b0063614d4445bmr14003146qvk.9.1690964212427;
        Wed, 02 Aug 2023 01:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690964212; cv=none;
        d=google.com; s=arc-20160816;
        b=UN6ZsqdyBdtIk47Z/SWejAiI7zFXDBAjBfM8QrY8HB3SS9dxV8Rysm0ybo/lkjiknp
         pyROOjO7VwfFXP8ffbbzqKEa09Vlp0gc6DfPdt6D/P/GCZF3JTYBhTWKPHBIAETDkklP
         1N5Iiiqkb+CIKdFwQq0y2zo0rSeDJh/Oy8o+H/gLuMYRc9i76aPW6iT62KfLg4DZ0R1B
         VPNpS6XTfnlcOLtO7NkFC9v+1MADUi+iQcmauW0f9DnsBNOXxg03Wwwo3Yoz1bQRJ2XW
         lvdr2V2xK4yo616JvIfWyxMJ4I+QhE7lGtOjtYZBBvEM2O4zgsJIsyjh53TTkk5+T3rM
         u+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=rKKG8Hjl0G8JZSyEDbTleDCllGmaKVn7mYPvBwuzKgs=;
        fh=tl8UgRG0xSD4aRc22f14Nbk3e8GFtmQ/L7R4zQQBToE=;
        b=ga8A3OIpB67uQozW6q/VYBw9c2dWGN+ujNZrymqpgmb/6sxkVa/ZGuslFecbyR/KHF
         GYGa3SyT/FHUEreGQn23Vk+IlccHN1m2o/s3TfDQvbL4mLSJkhBFDaGne778EiXIyqQ0
         h78Mr9A4ge56ZO2kX5sJEL+Yi2rs5syl8V98s5WTYNTYbf3jb+sd/Ff28jhMgjSfJhUs
         rGjwjoIDL5GYKh+uIl5trEdYdZIXfrkursb2GigYgWz6dyCq0YMNMdT/AZaAVp+bwqB8
         yOoUDRSG11rcaaF3S18WLZpYc5mxd5E9alKUKzHTdIhc4oM3fNqt/zxkOaeLCsN/Bdwq
         S7PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dj1cDM5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020a0cf40e000000b00604b7e1f5ccsi8552229qvl.279.2023.08.02.01.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 01:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dj1cDM5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qR728-0001HW-SP; Wed, 02 Aug 2023 04:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qR726-0000xv-W9
 for qemu-devel@nongnu.org; Wed, 02 Aug 2023 04:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qR725-0006XI-0s
 for qemu-devel@nongnu.org; Wed, 02 Aug 2023 04:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690964195;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKKG8Hjl0G8JZSyEDbTleDCllGmaKVn7mYPvBwuzKgs=;
 b=Dj1cDM5h+08hHwuILwhV/wtLZ0ll9KGwVtpQqIYFUeJnYyN9LJjnb2HUZ2cOQ31/gq4+Rw
 BKX9VXz1mdCTEMits61ZE+EfoTm559OLGxejGWc9JQF2RROy9cRdgD/pcg2wXneS1CcGpt
 VAvWmOL+s8xgB5AiGCgHdE2Mn538Omk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-696-7W5qzLw6MUetb3vBF8S-RQ-1; Wed, 02 Aug 2023 04:16:32 -0400
X-MC-Unique: 7W5qzLw6MUetb3vBF8S-RQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E345686D01D;
 Wed,  2 Aug 2023 08:16:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC08D1121325;
 Wed,  2 Aug 2023 08:16:30 +0000 (UTC)
Date: Wed, 2 Aug 2023 09:16:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/3] linux-user: Fix openat() emulation to correctly
 detect accesses to /proc
Message-ID: <ZMoQ3N2VShyR73fR@redhat.com>
References: <20230801230842.414421-1-deller@gmx.de>
 <20230801230842.414421-2-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230801230842.414421-2-deller@gmx.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x/5aKdZsul99

On Wed, Aug 02, 2023 at 01:08:40AM +0200, Helge Deller wrote:
> In qemu we catch accesses to files like /proc/cpuinfo or /proc/net/route
> and return to the guest contents which would be visible on a real system
> (instead what the host would show).
> 
> This patch fixes a bug, where for example the accesses
>     cat /proc////cpuinfo
> or
>     cd /proc && cat cpuinfo
> will not be recognized by qemu and where qemu will wrongly show
> the contents of the host's /proc/cpuinfo file.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> --
> v3:
> - use g_autofree on returned value from realpath
> 
> v2:
> - use g_autofree instead of pathname on stack
>   Daniel P. Berrangé requested to not put buffers on stack.
>   Using g_autofree keeps code much cleaner than using
>   extended semantics of realpath(), unless I can use g_autofree
>   on malloced area from realpath().
> ---
>  linux-user/syscall.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

