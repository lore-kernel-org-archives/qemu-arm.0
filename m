Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp966319lfo;
        Fri, 29 Jan 2021 01:24:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+ejaSavqGexBQeaHrGQHRXs/ipoHZrXyuqm6rEwBjiw3v8vZtzh1r1JmnKVwOrxdoPJB2
X-Received: by 2002:a25:1b05:: with SMTP id b5mr6096611ybb.298.1611912280092;
        Fri, 29 Jan 2021 01:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611912280; cv=none;
        d=google.com; s=arc-20160816;
        b=fPXwSxj8RzfKzVFoWtu+apYSTcWQS6BYBnzwQsSrYL9HzcyjbQjptc5XqGdiCvsOCs
         e37ZH8RdmICYVFas4Jb9AMbShEhk3jsfo9TdzZ8xbFruS0xA8tJOgpqKYrq0Qjw4HC+y
         Fwc4ph8poMHsfYIXxPbB/x5K+Ku+49wjEFeFmaSx48ohy6uCHv6aT/wmiZDbguWWhz80
         k6cOuVnXceVjTDcVKOljlkKZrYowQT2UDb6me3N5D4w/j/HYSw13OiiSXe0PTA5/RRnA
         jMapsXLN4D3cjpTDNB2Q7WLBqmGpzzZ59yQc6Q1KpRhSaeJQ2VJMMQSkxxyGfCHZHWBv
         qWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=9k9ttzpdc0ZZgPU37BNmKD/a9dVEm1P41CKaNPz4vMI=;
        b=C2kaQs3hHVmrqDTivgmTpic0FzdJUusahbP+WdkUs2xPq/BKaEV/xKjZKVxtcQPR2T
         BiezuhYKI1/DWl5x0qbeoNFgs15VceinluywMMOxnPuYeGo5OYzGt4Oh7j4sj8PSSIui
         GoQO+2Aost8kLfOKVS7nMefaizAPIqLkHuKcq6JzkmnOTfSTeYOAXdCSzLWw7CaMlFmk
         +tgcexwVT46ndxtzUQFj8y4TCNn1Fwa6XtHI6drFveKeC/AhCjZyDA/lSf149DeGY1zw
         WfQfciZhKcgmzX0JayjUNyqkmM0u/CTQoDuEIprnmlTZgghJWSLEneVs3aaAWzvYQd/O
         b4ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XILintGK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si7699110ybp.365.2021.01.29.01.24.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 01:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XILintGK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Q19-0002vF-CU
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 04:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5Pv3-0007j2-Ae
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5Pv1-0004dN-Ls
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611911897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9k9ttzpdc0ZZgPU37BNmKD/a9dVEm1P41CKaNPz4vMI=;
 b=XILintGKzOT9F59uVgviQPGmdzqp/iddyxp2N6J7bCXpoxVkPg9DxMgETkSPuto5RhoJj5
 bo7QEgdVb1dG2ksObQTcI48wU0qaNYwLfoYp53gn48T0oA0WsPhUz3W5UQxgeNn4KsH7wg
 prtAYgtoKUHjUbrCfbBWI3MgY0jLLdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-WCJqzmNDOyygyow7k6em8A-1; Fri, 29 Jan 2021 04:18:13 -0500
X-MC-Unique: WCJqzmNDOyygyow7k6em8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E5FD81C4E6;
 Fri, 29 Jan 2021 09:18:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21492105C720;
 Fri, 29 Jan 2021 09:18:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6385C113865F; Fri, 29 Jan 2021 10:17:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
References: <20210129081519.3848145-1-armbru@redhat.com>
Date: Fri, 29 Jan 2021 10:17:59 +0100
In-Reply-To: <20210129081519.3848145-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 29 Jan 2021 09:15:18 +0100")
Message-ID: <87tur02jaw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, qemu-block@nongnu.org, quintela@redhat.com,
 andrew.smirnov@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k0I+OOaebQHG

Forgot to mention:

Based-on: <20210125162402.1807394-1-armbru@redhat.com>
[PATCH 0/3] Drop deprecated floppy config & bogus -drive if=T

