Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2232905lfc;
        Fri, 5 Jun 2020 01:34:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9+6tsfFfdSS8hwGb+boiDqWp7Hf6vGUx5+gVA+iWZYYAcTYg+vP8sBE0RF0oooSVg1ynK
X-Received: by 2002:a25:e42:: with SMTP id 63mr14541139ybo.161.1591346051165;
        Fri, 05 Jun 2020 01:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591346051; cv=none;
        d=google.com; s=arc-20160816;
        b=KTaEayUT4K2uQ7dTiN+9z0QqZ8MJBQDtJTSLpfXWRzpdqCkO88JIFI6dHCFbfS6loN
         5y2X+M6NwZQwXDL1B5nOYXCoH6ulKYtbn37zw4+s1Dk9t19p9Rt7vyWHebcX5eUSz494
         4/Tr6c5kzoJyIpj9A2MnxWV9OJ4f8RTdup6lIf/+pDFn7+1HpWx6KcYkJdQrZ5LnqD/j
         n3oERgNKVhsheKQw+E/d5+I1JngnHx3L7VgwT7ziKCyFu4O6X69CDXP1GR3MHz8tmDes
         eBAjgr4s1IfSNispnbp/MeM9s9dx/XAx/h1PJSxbW13l29Fmegods2gB2odjZI7FWfGh
         M8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=WNn5FjO6kki+ZnsrHrTD8AKOT/6BjCOU6nWPGebLiyc=;
        b=B7d2EGrQPkZdWVCKlygYApaB8YPWnKuUudyKU4rKNL8TpzQ/JH+/e4R3fBmXp/9eWE
         lEKH6vOqjZyG4j+jSxGtDQKhZKv07GKdvIVxWCVK8K7Y4OE1or3uQzJS8s7lduHuTlcW
         LzKZrMOksFrDIoQSycrdH+Glq1qFyD1MLcsqCdUZooApRA8ZG5D3kaBvOMInWF80MxI7
         fRI/+s0qqWEsklz7S2puZRdH70vck/yrmILAqGMLG81gDt8ZwvlPmmOG7Q/pL2fMGEo8
         fh9aB/mfQUKzIp8cUmTp2l4O3KKOp1n9c/ylfWeWfpGnIa5jI0jibE505MGoHthTaEKT
         nnIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f2RRjdUa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si6237323ybu.422.2020.06.05.01.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 01:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f2RRjdUa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh7nm-0002eY-Iz
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 04:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jh7ne-0002bB-DY
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 04:34:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59794
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jh7nd-0000E7-B8
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 04:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591346040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNn5FjO6kki+ZnsrHrTD8AKOT/6BjCOU6nWPGebLiyc=;
 b=f2RRjdUaDh4aPhYiUxAskjBztZMeS0rnbTBsas0dl7tMIO8W8g+UoUp4RTwQSaXhnpydIi
 rayb7QdpuT2TZaJ+oGLFS/22aCFn9I+WVdq5HebyluYvjQwP/RgDifa2TKht8QW4OkA/rR
 zCK/d0SiZeqSfLohiIWoRshGpO4XnUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-6N7oljinNtCo3Y71V6cL7A-1; Fri, 05 Jun 2020 04:33:59 -0400
X-MC-Unique: 6N7oljinNtCo3Y71V6cL7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6D78835B42;
 Fri,  5 Jun 2020 08:33:56 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 516F810016E8;
 Fri,  5 Jun 2020 08:33:45 +0000 (UTC)
Date: Fri, 5 Jun 2020 10:33:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] numa: forbid '-numa node, mem' for 5.1 and newer
 machine types
Message-ID: <20200605103343.284a4268@redhat.com>
In-Reply-To: <5a4a1b6b-694c-6814-2ab8-93ba6eaa4b2e@redhat.com>
References: <20200602084151.480567-1-imammedo@redhat.com>
 <5a4a1b6b-694c-6814-2ab8-93ba6eaa4b2e@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 rth@twiddle.net, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmKPVzrJemuv

On Thu, 4 Jun 2020 07:22:51 -0500
Eric Blake <eblake@redhat.com> wrote:

> On 6/2/20 3:41 AM, Igor Mammedov wrote:
> > Deprecation period is run out and it's a time to flip the switch
> > introduced by cd5ff8333a.  Disable legacy option for new machine
> > types (since 5.1) and amend documentation.
> > 
> > '-numa node,memdev' shall be used instead of disabled option
> > with new machine types.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >   - rebased on top of current master
> >   - move compat mode from 4.2 to 5.0
> >   
> 
> >   docs/system/deprecated.rst | 17 -----------------  
> 
> Lately, when we remove something, we've been moving the documentation 
> from 'will be deprecated' to a later section of the document 'has been 
> removed', so that the history is not lost.  But this diffstat says you 
> just deleted, rather than moved, that hunk.
> 
I didn't know that,
I'll send v2 with this hunk moved to removed section

