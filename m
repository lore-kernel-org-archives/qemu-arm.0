Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4799623lfg;
        Tue, 16 Mar 2021 11:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+D9+H+3UNQ4YZWdbIlahpmgyt10cHduRxMexnhhPnlX/fsznji1mGBkavx7qaB1tcCtk5
X-Received: by 2002:a67:2dc6:: with SMTP id t189mr486427vst.32.1615917827493;
        Tue, 16 Mar 2021 11:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615917827; cv=none;
        d=google.com; s=arc-20160816;
        b=jlSwKHAHcYm761A7ttLO9AAOxapZuEAxCZdfaToPPRWdr2KZRC88u/btrAZJItoBBR
         XsRLW9TUO/LIyiMxw7xdG6UZr4cLdM7ckHQFY+h8z2nTPHCjMlM9acL7tJY8lfYdo4KY
         bkW29dltcB+76izESlehqmXfdOA79Z5VRC/qi2VaLAyQIVgu6kOBr+vpUsLTP5KwHCW2
         tlBH+iKj0FN2pF+GvCrBx6mRUNb/yNLPcqsLQHzVDZs+xrmRdW6bSstqIoOvwrhqo610
         nGSZXq3sWeD1oIzjUie1hxs02D3pG8wOTJIH2cJI9pCadMpV2ibTy+Gs7WlOVVFeCqLr
         IkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=9yBEYICh4gHnRYvZj5OlSNdlRg455KJ9DjCYsonyHW4=;
        b=vlP50iYc90EXN8NoKuLvE9PEqBK/gM5NpZGo6UvIelrJu3loBtqQuqTSDXLJu5tbxg
         Eluw6JC01X2UWHKx5s7h3hexol7NsurZmIT0MLw7em11HlOqLBTZCOhAYRg3l210Ht83
         BPXewYGbhuZhoo4Wza0Q48egC/mRyWWrPiMD3XAcZoQ3FQ3RxkTUDDGN8q7Qf2ajng5h
         cEAKQkkyDIxbD0w8fmSD7BXHlo2UMrZSjo19SRCSboOvawKH7rXQltRXYH49TplmYGJa
         Ui51USt4WXC4J8+bzANQZzeoJ15Oa7Tna2QjrZpdB8ZPgdAgwoMDCwybUOneW08sPG58
         3XuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d++ROyWg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si498327vko.90.2021.03.16.11.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 11:03:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d++ROyWg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lME2k-0001Qn-M3
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 14:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDXW-0006Ef-ON
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:31:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMDXS-0004YL-Pl
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yBEYICh4gHnRYvZj5OlSNdlRg455KJ9DjCYsonyHW4=;
 b=d++ROyWg0MbK5MvlEx+w4uXm4wVpBkZGUlwJtulfIYBDKxtE2GLZpKYgzSk8x6cIV8h1Nq
 ZQJUz1zjq/ZZ71zPKcVkCm/0760DdqsZv0V2M4Yd/p4b8OmktFXo1bqaukC8SSer8S4QA/
 IFLBAcD2yFC+8uYoxx5RmbG1PumOv0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-bZPU95-UPI6CrTnXyibflA-1; Tue, 16 Mar 2021 13:31:23 -0400
X-MC-Unique: bZPU95-UPI6CrTnXyibflA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91925800C78;
 Tue, 16 Mar 2021 17:31:22 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B025C1A1;
 Tue, 16 Mar 2021 17:31:18 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] tests/qtest: Add qtest_has_accel() method
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210316172449.3148634-1-philmd@redhat.com>
 <20210316172449.3148634-3-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <fda2668a-ae03-b554-8ef5-6d25aa65d7fb@redhat.com>
Date: Tue, 16 Mar 2021 12:31:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316172449.3148634-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UTqPFRQANu7C

On 3/16/21 12:24 PM, Philippe Mathieu-Daudé wrote:
> Introduce the qtest_has_accel() method which allows
> to query at runtime if a QEMU instance has an accelerator

which allows a runtime query on whether a QEMU instance

> built-in.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Since v1:
> - rename qtest_probe_accel() -> qtest_has_accel()
> - run with -machine none before creating QTestState
> ---
>  tests/qtest/libqos/libqtest.h |  8 ++++++++
>  tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

