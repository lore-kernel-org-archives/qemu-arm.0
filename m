Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3122088ejb;
        Tue, 21 Feb 2023 02:28:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+7Pk98mHfsvQOJYybxiT+IEYNjjOZBzZDVAGVk01UOVtcCigIOV/u4HIVTHTOFiaVjImL+
X-Received: by 2002:a05:622a:206:b0:3b8:67af:cfdd with SMTP id b6-20020a05622a020600b003b867afcfddmr6443527qtx.36.1676975331446;
        Tue, 21 Feb 2023 02:28:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676975331; cv=none;
        d=google.com; s=arc-20160816;
        b=isFHg9B/KceUvZpgYcqGdOdewATUaTs7UxubiQDpfj8j3SkNsybhZISalw+GO4PpoL
         R4Auh4s/BinW2bpBqlniFx9cF9L/IaNP0rv6rWkITRAujZMJ8lDZsTBpbokMbONawQ9q
         XnkdNIqpXEJyQUf7/Nl02l5P6QXHjzAmfq7EckGhzi2yfFvuohHlxxzTA6/uDANhAq3D
         eP1dkGcMOzsXpk+HBjfgEoV/t8Z19mvG4x5OAt8ST5U557Y8+0ODUNaoWeMLC0TKZ2Pg
         Aznguo5cB0YcvOVHLwbSXjcI0OV+Ue40k+jLygDplVEb3rl0kiYU1Zefq2ubm4iOzzWT
         RyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=IR5/vs/rFBvNuILAPdLBT6AgUZWmJrj4OGtWctwXKbI=;
        b=TVLPe/R58nhN1z/epYWvPxlNO3byILdL7861zO9HaTGlZuymyK50whWL3xj0xQZ79x
         ZnaqZhOOqvrydXTgkzNWyZiSrdOtKiS30hFEKpbSeqYrhKyQ+UfcRdnQSBR7KC3KCs18
         Ww4PCC+Yq/VJfy5Z3oZZNEJ35b91cRDIpw4gcF3P0Pwtv+LCu9p8gV8wWL0wHBsEx2Pl
         U0fF9GfggqsF2Dkjb/xpg2gjatJT/4s7OPLK8TEES3U10vtHcd4LaUTEep6WrdFhgujx
         BsHeLtsfkB8mxoqbTXNVOPFOUmbLEVV/UgzeusQNfkVYi5e08EQWYNiKrOa0vB2iBIM6
         9K7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eZwwy3wf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ac8488d000000b003b86b4fb399si46868qtq.425.2023.02.21.02.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 02:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eZwwy3wf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPsz-0002Yi-Mo; Tue, 21 Feb 2023 05:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPsy-0002YJ-3P
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:28:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUPsw-0005kB-2n
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676975313;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IR5/vs/rFBvNuILAPdLBT6AgUZWmJrj4OGtWctwXKbI=;
 b=eZwwy3wf/wMd1raVhrdYa96zOamIc9eiXPdcrRwkHIAHUqD5EeMzgffdvqndcZnL89e0ri
 kboP7vk5Td9wxVNA4kv5SpLt6CBFQufFw2bE8Abuz/55XCA0bdLy/fVg4fMDHpHvsqC3I+
 9qmeUD2AlW5Y+nOWK9rLa96B6UCH70A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-BVdBxXiLMKaq5AIVRkuCFg-1; Tue, 21 Feb 2023 05:28:31 -0500
X-MC-Unique: BVdBxXiLMKaq5AIVRkuCFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02B8F800B23;
 Tue, 21 Feb 2023 10:28:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20FEC40B40D7;
 Tue, 21 Feb 2023 10:28:27 +0000 (UTC)
Date: Tue, 21 Feb 2023 10:28:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 14/15] os-posix: remove useless ioctlsocket() define
Message-ID: <Y/ScyLdUZYi4ehOx@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
 <20230220214859.3792171-15-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230220214859.3792171-15-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hmSHOsHaGrTf

On Tue, Feb 21, 2023 at 01:48:58AM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The API is specific to win32.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/sysemu/os-posix.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

