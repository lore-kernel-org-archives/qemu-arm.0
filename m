Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1402870lfc;
        Thu, 4 Jun 2020 05:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkJI+sLciSbJKGvaK532jje3K1orZeATdPKMzyjNw3nTRXnd7193+9/iq2GKba89iFrDBM
X-Received: by 2002:a25:ac8:: with SMTP id 191mr7297553ybk.390.1591273400417;
        Thu, 04 Jun 2020 05:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591273400; cv=none;
        d=google.com; s=arc-20160816;
        b=D0bmzzx5mJg4B9ND9vjeF9yVCsdVX4ziABj6TiWjqswQo3Q39yxRtq38hhoqfyTjAq
         rNOck0O9ZAbAP760/0U3Nw9ZZpTvat9fPXsegXssk2fLfqKZEesUwYgCbgsV3/iV/cOJ
         X6WPP6P0D88zvCdJu6A2lx2qu2TZXLZ2LmhiKB4F0cXZ97+XvlPCuNPu+hw3bepDkhF3
         rdCBSKgkMv5Ddc5yB9SeqolUzMavRrjSngz1C7e1Hix+U0827IadMYvcitRti8vpxPS3
         /PPxkvnHyQIUD3HEB7GYEmfPkCl9R8mX7RoDaO5Q9gRm8EDcMRG95N9hk8iPjTC4Omi+
         z/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=xCVsOTyTmjwn1r1Pw3WS6t99ZT1GUWyeg/bdaIy3FhA=;
        b=Vqkj67yS6a7jITHkVyrKRRPC0oFan3IAEaPyX+jeVpZfEiRMJZY4lAuggFER3w9LAQ
         83mfxKLhszxmJS2KBLaBUsoYI2t1Lu/FCPud5fJf1mUNQk+trw/iJPa8UBrUygar6o+V
         dl0g9eJ50q5ZbfkNf+kTyGb5UcjLuWxTpAWLYUYa9RyTTsq9hgMcWPVIrPFxyNasmsFq
         qc42YWyl3xsFX5N9ry3rjIzBRLw8eyMx6f5XIz64DZnP9OPVy7o5WDw4hWXEgjui9JNz
         vQf+kZDuqFv7vwNt4+jlsK7fu1EnJ093m832C9cfzT8s4O4v7/gUvdtgkeOFGiFIkMG9
         RoYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YY1TLxSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l135si4155794ybf.80.2020.06.04.05.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 05:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YY1TLxSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgotz-0007Vd-RQ
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 08:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgott-0007Tw-5Y
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 08:23:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60857
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jgots-0005Vf-H6
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 08:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591273391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCVsOTyTmjwn1r1Pw3WS6t99ZT1GUWyeg/bdaIy3FhA=;
 b=YY1TLxSrv91orRk4d2IEv9xbkLaxgB6GD2BP+/PeKpcZ0ndAycU4F5nq+C/FaoFTuDOcjb
 l89fEGvTNbLJvBtsNU6fkid8XNSNgy0K5DffNbXPYEI01apY7j4ltf8SsIEdEkzZvQ5M6e
 xHXPmhiV7rjHllRRxKlxidBIPmQcqic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-phIqliCWPzqaaNaKV37cVQ-1; Thu, 04 Jun 2020 08:23:08 -0400
X-MC-Unique: phIqliCWPzqaaNaKV37cVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64197100B79E;
 Thu,  4 Jun 2020 12:23:06 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F25B07CCC1;
 Thu,  4 Jun 2020 12:22:51 +0000 (UTC)
Subject: Re: [PATCH] numa: forbid '-numa node, mem' for 5.1 and newer machine
 types
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200602084151.480567-1-imammedo@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5a4a1b6b-694c-6814-2ab8-93ba6eaa4b2e@redhat.com>
Date: Thu, 4 Jun 2020 07:22:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602084151.480567-1-imammedo@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:14:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 libvir-list@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, rth@twiddle.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gI4poQ3e8R0i

On 6/2/20 3:41 AM, Igor Mammedov wrote:
> Deprecation period is run out and it's a time to flip the switch
> introduced by cd5ff8333a.  Disable legacy option for new machine
> types (since 5.1) and amend documentation.
> 
> '-numa node,memdev' shall be used instead of disabled option
> with new machine types.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>   - rebased on top of current master
>   - move compat mode from 4.2 to 5.0
> 

>   docs/system/deprecated.rst | 17 -----------------

Lately, when we remove something, we've been moving the documentation 
from 'will be deprecated' to a later section of the document 'has been 
removed', so that the history is not lost.  But this diffstat says you 
just deleted, rather than moved, that hunk.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

