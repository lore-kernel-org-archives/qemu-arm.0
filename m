Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1391625lfb;
        Thu, 26 Nov 2020 04:33:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp1D77wPBm/BNZ8lTs6VoQSKnBOVKuCFrPswU0pVHeET9SHLp+RJeuIHDBUBFFbl/y9Cdu
X-Received: by 2002:a25:c6d7:: with SMTP id k206mr4444686ybf.244.1606394031463;
        Thu, 26 Nov 2020 04:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606394031; cv=none;
        d=google.com; s=arc-20160816;
        b=L51BKDqvbN6FIpmQjBB+vTvihx4hsbzDEhKJDOAyJF9xCLj0z1lSU2D+8pb1rSRtxF
         DvDdYltNUXtJP0j9jfy/AWEhWQp7a/m5E101Dw9S98vzsj09A5i8m862EkjoqMz3XSd/
         dnrvFHDkm6IE/3+Ie3lpFVlJBsDyC6q3C6NzMtoHQekPqA9NMWz7nM09nQ2fBxFutXU9
         p8zIqmGu2QQnDJt0DuTRQxiBtcuU86aXWDNNuPjnLdWIUNMAKTrxEdwxhoDP0jnWoVoQ
         1QFv+5HjLiuDI8ML3JpW2x/pMg234I1/yh2o55r8djXI+r8/7taDBHpxKt+lOVW2s9PT
         VunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Wp20gGN64Tow1auANnn2ZbI6aHh2rKF4jqsw+EjR4qM=;
        b=ZKhIlP7jEg6BF+fmd5POQHFDHCplalBG2af5OKxikUMrkkoqoYcjJKdZBCaEo+Na3O
         fxoLbl+trWtX/szKZ+J8/7hQbapnrGRuKM/icl+Q7PSSO4bTtMqkHC6jE4s3sK4Toh/Y
         kUNvZPjNqGp7qGthuel6Uq1fa52lRFmI7MSEmgDxGU+RO6Uk4I3IC9RW53+fmsKhlq9F
         +6SNtmyc/ytdfcj2sCE9i30aX1+0lAa5c2TTYgL2+g4MY3YfQpfS/KWmNo/+jj/x+6xk
         qCJBmEuFzJQ6uJuB8QCmTEgB7tJ01MkAqSyG21G5pui+s7CUCRYSOUi78aWaZ7pYY7TT
         sSOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TuQhfkkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si5707803ybj.82.2020.11.26.04.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 04:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TuQhfkkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiGT8-0002pW-SV
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 07:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiGRo-0002Ll-5o
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 07:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kiGRk-0001xY-Ot
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 07:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606393943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wp20gGN64Tow1auANnn2ZbI6aHh2rKF4jqsw+EjR4qM=;
 b=TuQhfkkm66nlvRdbw3kxgdRU14fwBVSuJtwHqfdSjcIc5N++kpa2yituwEAerMGl+/ZlhW
 MGWD3JG+NsGHk6lwYI1nOYh3Sw9uxQKsl/Y725ycSOBDZ4Gq0z9gB0PVaaA/r9v+GcgTfq
 5Kl9ORQJBt3kQEBhzUh2LHx1DzXpydw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-fZT2qjuFN-CxB0wh3PHDdA-1; Thu, 26 Nov 2020 07:32:20 -0500
X-MC-Unique: fZT2qjuFN-CxB0wh3PHDdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 470891005E44;
 Thu, 26 Nov 2020 12:32:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 401B95D6AC;
 Thu, 26 Nov 2020 12:31:56 +0000 (UTC)
Subject: Re: [PATCH v2 1/6] arch_init: Move QEMU_ARCH definitions to cpu.h
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-2-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <997c0d21-6111-2920-7b87-499afa7d36bb@redhat.com>
Date: Thu, 26 Nov 2020 13:31:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201125205636.3305257-2-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cc86zS14E0+M

On 25/11/2020 21.56, Eduardo Habkost wrote:
> Instead of a collection of #ifdefs on arch_init.c, define
> QEMU_ARCH inside each cpu.h file.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---

Sounds like a good idea to get rid of the #ifdeffery!

Acked-by: Thomas Huth <thuth@redhat.com>

