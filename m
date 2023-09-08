Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp417883ejb;
        Fri, 8 Sep 2023 06:19:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXsuqpzTvZ2Usf0CUmx4egaXUaIUCeuw+CNz4wH5a2obIVsCouWcnI0+CLgL16RGWCpLqT
X-Received: by 2002:a0c:b395:0:b0:64f:91fa:4e9e with SMTP id t21-20020a0cb395000000b0064f91fa4e9emr2459764qve.16.1694179142197;
        Fri, 08 Sep 2023 06:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694179142; cv=none;
        d=google.com; s=arc-20160816;
        b=cjuyWHtKPg6ZND5IUJ9UMULUBD/QotK/2NsTg+IyAABDSIyD7OKfc/6SVZzZXEqjzt
         21p/n8MxjBaOJY2rfXFWwvW+NGtrDRhWd9NuHhiAhS9CNxbooDRkjXS4Zz2bmg5Vl7/D
         mZK9MroFk0vL9TqI8wOy//+YlKkWhA9wAzfjoP5JFqZcvCIxcEaObgM3eB4exReVyMOt
         HnwzyBsK9JE7QnTExRhRxoVuCMDAQhh0i6Wl6qytZwcL6AK/Ejk+PTVCJI2yWIDdvvPG
         7WZlPsIyjwPrUm8Ov3/jb16dM9J4CfWMz5DAWjExQG3Mu4JhsJ0hg5Gx4sjHMTNPxMt5
         rkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=WDmpYR9quBi4N/VtwmxtncdE/jjVwWBsVOjZ2UfZScQ=;
        fh=JuhKKXabopZkyU2U8rkywuobb9GE8ppGsi/Df+kN7jk=;
        b=MOgPENgf2xZsVW0FbwT91/XgA5+1kV6ZDHfyIrwLHJWNyrtfHlHRDNiQ7dfP4WDMEz
         tu/NM3wyXUr2rZpXP2Z0RZctsTs+7UxJIaSSOF9Sz2oajqhJJOclQUpvSX5EvDexpPV7
         7ZvdApA0JNLev+pnG8ihny05lVtXr1VvCUJ4+HzyE1m/Xoj5fEdAOCd+EKGaUcOi6LPR
         OPB9ELi05GtuMjN1txzo/wxlKYCjbTzYqfq8hg/CwRlNrczm77bk8ncLMINStNvRB9fG
         5xrSMtM9cEPcIq0w7CkHIzklb8hHlFsDgMIC2vLKhGJZ7YIb7ONSxOrDxU0CJ2Cphx/+
         cb+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D+RsgM9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020a0ce547000000b006559d5ec1c2si1069195qvm.228.2023.09.08.06.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D+RsgM9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qebNf-0003l4-Dq; Fri, 08 Sep 2023 09:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1qebNa-0003kN-4j
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1qebNW-0007b9-3k
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694179109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDmpYR9quBi4N/VtwmxtncdE/jjVwWBsVOjZ2UfZScQ=;
 b=D+RsgM9iVTH+5jADlbhXbnsNgEFlLMQJuBAS4Xyo4Jopgd/5igWCX1+GC2thnEbMYNDWBf
 XNK91mCFw5If8F6/50qAOjkzJiPQxv6JNIR0Sk1/DW9xgB7e2hqizVRBqGFBZLnJ4TDNOm
 FocQwC86zJbLTh56sPXvaq2dbppNXis=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-8EtIfpGINV2OPYpVFFJtVQ-1; Fri, 08 Sep 2023 09:18:26 -0400
X-MC-Unique: 8EtIfpGINV2OPYpVFFJtVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 964D8101CA83;
 Fri,  8 Sep 2023 13:18:25 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E161121314;
 Fri,  8 Sep 2023 13:18:24 +0000 (UTC)
Date: Fri, 8 Sep 2023 08:18:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 15/22] net/eth: Clean up local variable shadowing
Message-ID: <4mcygm5jtwl3ixx6csuwwgw57jgoyvp6y3awb55r22tfm3u2sf@jarydjrm5ruf>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-16-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904161235.84651-16-philmd@linaro.org>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0YtePbAfWxmL

On Mon, Sep 04, 2023 at 06:12:27PM +0200, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>   net/eth.c:435:20: error: declaration shadows a local variable [-Werror,-Wshadow]
>             size_t input_size = iov_size(pkt, pkt_frags);
>                    ^
>   net/eth.c:413:16: note: previous declaration is here
>         size_t input_size = iov_size(pkt, pkt_frags);
>                ^
> 
> Suggested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  net/eth.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

