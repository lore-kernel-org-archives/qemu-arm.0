Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp909892lfb;
        Wed, 28 Apr 2021 11:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ0t3xbZ7wqd8+AecgcLQh/kURSVCE+5V1um+3JhV0gmMMBYgFoEA77LR63szRjStSaiU3
X-Received: by 2002:a05:6e02:219d:: with SMTP id j29mr24982282ila.204.1619635869883;
        Wed, 28 Apr 2021 11:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619635869; cv=none;
        d=google.com; s=arc-20160816;
        b=Bxn8E+15bbQndXaUtP2B5yWlVUTrBNrHLap3tJiIX5sC03ma/dRfLQfwC+muJ5r3pl
         TdxtCuzeK9phLPQAu1zC6349NhJdlkAqIxprEsmQLjduw9+UeDZOmXfzOxY3f3hqgxXx
         V/n3K72C5/u/o1UICjCDZ7GkZaUxusihBvQpbGHK/PxiFctCNbVgfFJIAK866Em8iN8v
         zYBevrVnDpOnzjie6bXb5XigZH930lCIRCOEDyiuRNAHbp6XBYY/PZQz3mOYdAqk5uC/
         h8ozyCgB2aHU7qPu9L0aWWk5lUKoAAhfMZNrjxV8gMFg7jRu2DEBcW5uuYSnS27A4wzc
         MYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=cdftgPLvqAZa8yZOa1exDBS2uHHiczkANDH6pZNS3v8=;
        b=BSrDVRl+tuZzlJgQBkacGTcZhTSobMA1+YpUrksBKfl1FLkA7RuNm4INhoc3Sbvn29
         MpO6aemQsvTVZOgDE/GGcNx3kPzdQX3u+wDx46/sC1i6RQjowE6DgaUWDudfgrTX5epg
         3QjvLFkCIMmqgsPRnht880eZ7N0KXGC5tOrSzkCPUvNkltNbL+kUXPHsFokOALZrq/0J
         dvI6KcLXX+ygj/BpBhYAgHY6S4pqxWafomHRS1ZAxQdsPVNdysGYIt9QGiSTxnduMY/j
         exip/GgKzUbyFHLdM6KlRm8hlXtL1N0dxWU+FjMBoYptpwtTIQ3YwCAv0kledLcILfEX
         rAFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QvH2H0mX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si626566ilu.122.2021.04.28.11.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 11:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QvH2H0mX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbpHB-00049u-81
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 14:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbpGh-00047I-MO
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 14:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbpGa-0004kx-K2
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 14:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619635831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdftgPLvqAZa8yZOa1exDBS2uHHiczkANDH6pZNS3v8=;
 b=QvH2H0mXrZErTxUMTk5pLMG0JZInNxGUbUQB+N9duZ7nm012yNjRhJ1x+uSRdSnO6eTyL9
 xdQ+43IhnRjPs4W5xa45uWgf+oq6OIqdLvazOH/cWtruS1kkc3WK+P+fiJpZPdelgswzCK
 BAI5Us7OlAd56ZixvNDiBZ+o/vwnkTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-mdIQqgVHPKK8Fbe-Rsyuzg-1; Wed, 28 Apr 2021 14:50:29 -0400
X-MC-Unique: mdIQqgVHPKK8Fbe-Rsyuzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118F3501EC;
 Wed, 28 Apr 2021 18:50:28 +0000 (UTC)
Received: from localhost (unknown [10.22.9.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D17E5D9C0;
 Wed, 28 Apr 2021 18:50:20 +0000 (UTC)
Date: Wed, 28 Apr 2021 14:50:19 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/7] hw: Have machines Kconfig-select FW_CFG
Message-ID: <20210428185019.apliuz32xxx54sze@habkost.net>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdFpw09j3dwu

On Mon, Apr 26, 2021 at 09:35:18PM +0200, Philippe Mathieu-Daudé wrote:
> Beside the loongson3-virt machine (MIPS), the following machines
> also use the fw_cfg device:
> 
> - ARM: virt & sbsa-ref
> - HPPA: generic machine
> - X86: ACPI based (pc & microvm)
> - PPC64: various
> - SPARC: sun4m & sun4u
> 
> Add their FW_CFG Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Eduardo Habkost <ehabkost@redhat.com> (i386)

-- 
Eduardo

