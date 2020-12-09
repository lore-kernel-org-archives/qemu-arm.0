Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5162474lfb;
        Wed, 9 Dec 2020 09:57:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK6BcuMCDw/+RS51QfEiiXSQhMj/2X2GWkeqVWLPDuYl0bxIXpn8BEINAEQOyqgwKLQzoE
X-Received: by 2002:a25:168b:: with SMTP id 133mr5253134ybw.219.1607536648850;
        Wed, 09 Dec 2020 09:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607536648; cv=none;
        d=google.com; s=arc-20160816;
        b=qfegMcWuWqEFsu5WCQxMomNYgAqHQs6adlqMaG9znCzYno3ZYqFaEKbvi4z0gSzeWW
         qtyfRJ+4R0d4FOX7b8WcuvAjk1XRnUf0mzkhZ9Qrgaa4eqfWrNkyJTozys6k+YIR4bY2
         UZ9telDmza3fPP13Mmw1nMH7gAWVv9kVxglZvqYrcEQlLWs/C625Tcd9uYgIBoafGFg6
         LS0PEhqbeNBPbxvD+M7kaZYCuKBpA3w+YsrIaETX8e3UbQXwQXYkugyia3Y8V7X8+wG5
         cWn0lNTcOAdXTr5lX/+oWdaqHZK2PDZE1AJd5jqweuFHFw7asA5T7jV/arxAxQDKe1cG
         hQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=qJwbV/WrqViepUSM7wrg9bKlFwoWWL/Uxe1iil0/ixE=;
        b=q7qjhPDsUALaSYt/REgfxQxTj4jcaWGExo2Y8pX5Wc3IFmIwcPbzhydXFAP3kGKDD1
         Pa6JBw7sDIheUXfD5/EbqdLz6I6sBTpi9ntP2dhWPMIqyL8RM4BYQi6apB4E3euJ50sY
         hPWrGZwsCxaDEr86P6cGZtr3Ly/mIvy450diK1YyZessmYQfsvmNzu35Vcci9Lr5BhH7
         DkaZf5JR82f9hRWOgz1F9E41FtXko5wE+fp5xPUQ0vrzNHOYh89yUneSsuj+/WT3wtwt
         JNCicRqTXf59oYsl4uRlM4Y3bhIGLRIcO9ptbDxijj/wnloCvrM3nS4XFY/4wf7BMuO4
         NLjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Twim5yqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z64si2651348ybb.27.2020.12.09.09.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 09:57:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Twim5yqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kn3iS-0000CQ-7h
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 12:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn3i4-0000A3-1N
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 12:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn3i2-0004Qz-Dp
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 12:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607536621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJwbV/WrqViepUSM7wrg9bKlFwoWWL/Uxe1iil0/ixE=;
 b=Twim5yqI4rlr5SWWkjkj9FlWW7pzoZ8vzZfXZjaiK+XJRd7ee+e9HhurTgxsCdZ05BmTNd
 /Fk7LCG1X2JUNm4Db6l30oHsJfZ7XvQdpoHZ4U4T+xputP/Wz6XIH1kF7pR+gkDb9y7GXW
 2zeYbXliMSYctGS261Zt9/wDv9PvCoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-EC2nhIUYOQqRtzyee3kceg-1; Wed, 09 Dec 2020 12:56:59 -0500
X-MC-Unique: EC2nhIUYOQqRtzyee3kceg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DC910054FF;
 Wed,  9 Dec 2020 17:56:58 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8343F5C276;
 Wed,  9 Dec 2020 17:56:54 +0000 (UTC)
Date: Wed, 9 Dec 2020 12:56:53 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 4/5] hw/smbios: use qapi for SMBIOS entry point type enum
Message-ID: <20201209175653.GT1289986@habkost.net>
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-5-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JcF2Jt1W5XWv

On Tue, Sep 08, 2020 at 05:54:37PM +0100, Daniel P. Berrangé wrote:
> This refactoring prepares for exposing the SMBIOS entry point type as a
> machine property on x86.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
[...]
> +##
> +# @SmbiosEntryPointType:
> +#
> +# @2_1: SMBIOS version 2.1
> +#
> +# @3_0: SMBIOS version 3.0
> +#
> +# Since: 5.2
> +##
> +{ 'enum': 'SmbiosEntryPointType',
> +  'data': [ '2_1', '3_0' ] }

Markus, Michael Roth: would it be OK to extend QAPI to accept
dots in enum values?  I would like to reuse Daniel's patch, but I
would prefer to use "2.1" and "3.0" as option values.

-- 
Eduardo

