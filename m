Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1468015lfm;
        Thu, 16 Jul 2020 06:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYpYZb7kqCLIAHNQblbIqVdFmctOWh2f3e25COqjDFdRj094jbfWgR3xwq0fCrvCg1hcS4
X-Received: by 2002:a25:ac02:: with SMTP id w2mr6084609ybi.499.1594904825803;
        Thu, 16 Jul 2020 06:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594904825; cv=none;
        d=google.com; s=arc-20160816;
        b=jk0tCReC/M5Q0mbS8w0cSMowx1YTRSnkT00Fr1B6VIg3/7jkifZvmahzsi18dUlT0G
         28xzScIwqY/+X1fKWpPGmFQTSE7WoZXzTh6nQ1WV0wZxJWoP2ALRWOxACp8IQUa8GyE4
         LYWwL7nGXThOQhf1rI+rjo7tmqPpKaJ5H7TOMD/E3iEGlZ5sq+oBnEllPXvFHtN8/Ssp
         Bv305UJ1lrl5z+gty32Seqr2Z73KHDTBtu1oJgkZ8ENavGYCuHBxzg6BmYznxlG8Wu2J
         9+inMpFdvqbNAcNuu42D4AsmtozSLuT83JOiI0yfq4ra84JIiV8Gz/4siaPBj6S5KfLC
         AcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=xRcBudkig0CHxkDINv9gCJPiWE7iKzDOqeQhLg2MgUA=;
        b=iUfzPh0AiTFmyf6RNWnSYA7eYEy2nvviImKP+pNXlVbG+VAX87fjh0AjFClCzkRVMt
         8NLndFIs3qLbvosPTtKii5BMwjrP/WdBQo8Run2diJNRNQtGrHzW95hlmaQHROED5FPP
         XiuMETKPL03QbarLPUFjKBY7CHf+vXZWrfdbCevbiQVKtnxD6mY6HWpyo6TW2lSrjjCY
         4666KWm3ppQNycGvrmEpwiPTqhHo6JwofLIX1qEWfqyAPn3pM5eQDpjtEjJlAAAwoJ8N
         TzY9KH9PPx4I1Bbx6TEl8tdyDZMxfkO22KtNLynq4C9nUjm1Rpz0dnqSmFkrUlbsl5yI
         Bfjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRI99qKx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d140si5811820ybh.426.2020.07.16.06.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 06:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRI99qKx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jw3bN-0005zY-7g
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 09:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jw3aN-0004tY-Kh
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 09:06:03 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57808
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jw3aM-0007sC-0o
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 09:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594904761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRcBudkig0CHxkDINv9gCJPiWE7iKzDOqeQhLg2MgUA=;
 b=IRI99qKxlJ9fisjF9icR7d1dmMTvxI3iUzgz3WBCMgtLfgBpk/eypcWyfFmWRLLZzDg9Ew
 HzlLlArk26FDNT8YXpxsLiNg+QyzZd4WwPrcp8diLD3c6/10jlcwEHHxVOOWZl1D0Am6hF
 Or0yR6DfOop7BDieINSBIMS0EqE+6GY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-wUL5lP-JOGGuY9CpscWK3w-1; Thu, 16 Jul 2020 09:05:59 -0400
X-MC-Unique: wUL5lP-JOGGuY9CpscWK3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2887D1940920;
 Thu, 16 Jul 2020 13:05:58 +0000 (UTC)
Received: from localhost (unknown [10.40.208.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A130E7B408;
 Thu, 16 Jul 2020 13:05:45 +0000 (UTC)
Date: Thu, 16 Jul 2020 15:05:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 19/20] tests/acpi: add microvm test
Message-ID: <20200716150541.3f8c64e1@redhat.com>
In-Reply-To: <20200716091035.xkgp42f56t7eohjt@sirius.home.kraxel.org>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-20-kraxel@redhat.com>
 <20200710214958.36978f12@redhat.com>
 <20200716091035.xkgp42f56t7eohjt@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 04:55:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33vW42/OOqJh

On Thu, 16 Jul 2020 11:10:35 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > > +    data.required_struct_types = base_required_struct_types;
> > > +    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);  
> > I vaguely recall this belongs to smbios tables, does actually microvm provide them?  
> 
> Checked.  Yes, it tests smbios tables.
> 
> seabios generates something in case qemu doesn't provide smbios tables,
> so the test works.  We don't actually test qemu though, so it probably
> makes sense to drop that for microvm until we actually generate smbios
> tables.  Should we?

if dropping it just works, then yes, otherwise I wouldn't bother.

> 
> take care,
>   Gerd
> 

