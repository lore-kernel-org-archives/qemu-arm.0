Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp261827lfp;
        Fri, 24 Jan 2020 00:11:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqws/8HK0CZCD316BOikfFZDbYu6DpXk0foPF/bxw3vVhnwqFaW4Dv/I6A6mos3uDGzkI7/o
X-Received: by 2002:a37:6352:: with SMTP id x79mr1450731qkb.349.1579853470785;
        Fri, 24 Jan 2020 00:11:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579853470; cv=none;
        d=google.com; s=arc-20160816;
        b=Vsvb/ZsH9dMOXXbW8RPiYvKnvFEUa8DXA10grhPFTJXP8N8nJRWQBjLeRMNHU8fRAZ
         2OvctqSdE1tPgCYy9v/qV1qX8gkTXvJUwlH1Hu4ngrlWu0XMwh14DAdhimN6A521GEZA
         VNsmrknzJ0bHLay0OWmdZi0pCUP+Qv7kj/MR27fq7WBX//X6pFZYSAHyRCPScXs0YlhP
         Gv4SD9ICCNThISW+f6Sz8UpJhBuYdvYModNJIWygdxkGVVJrg2clUPH8GhGOyAajq1WW
         rsW+NoJp0SPCJ5GpjErhQdfGeHlmUl4sGHaATeQp0YFs3ZuDHMzCQZu3mr1A3cyzhuIU
         RYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=0Hx2u7UNLH2pgiFS6pXQKRZudiTLlIYjal3qOzorjd8=;
        b=HPj1Q1/h7PvEX0acZHTU5Acmi0VY9j0AwuoQ+xiQyxDJqP8VLhluVTxWHUiObYPuOE
         8NRJLt1AQ96seRmROL7RZMdd8VrHiThKGw4XIVyEPgZuNcasXeItZU2A637k5vHth0NR
         5tlwPQPPI3hYvnZRH5nABPYwE98CzD2YniD9xyXF8zrvM0zUyX54c7qNIZ+PHWeHNzNK
         e3npx7chlAiP3XxGdAdmbyYi8Aq36ThYsaWf3GnvXUGfzj0aALJGu6uS3QPr2TGaF3Yb
         xFucaG+p2dqZICfRXtZMNGvq3V21ktknFDTw2O5QsUxOsTT9V/KpaPW1Wb1T0+9/Vwz8
         frbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=grYZ2Ykl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c131si3541176qkg.58.2020.01.24.00.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2020 00:11:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=grYZ2Ykl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuu3a-0002Ie-6P
	for alex.bennee@linaro.org; Fri, 24 Jan 2020 03:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuu3R-0002IJ-U3
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 03:11:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuu3P-00082U-ES
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 03:11:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42982
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuu3O-00080A-Ta
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 03:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579853458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Hx2u7UNLH2pgiFS6pXQKRZudiTLlIYjal3qOzorjd8=;
 b=grYZ2Ykl31qIIlCXML6kr2o69s8+P5Jh+zPO363qSpmQAHlaQVhKbwtslN9QqUCpLcYya+
 5z4ZY4fX+thb9nKzskRs3fMhMb6Jj9w7JZqKU1cG7nLLZQMvLmYWNR4W9XDf1DhxhQDgfr
 HbcP1re7MGQjRSnIgE0xchOVDnTT4/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-meIjkUDwMravl6EhFMqRog-1; Fri, 24 Jan 2020 03:10:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A1318A6EC2;
 Fri, 24 Jan 2020 08:10:55 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4DB010016EB;
 Fri, 24 Jan 2020 08:10:53 +0000 (UTC)
Date: Fri, 24 Jan 2020 09:10:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
Subject: Re: [PATCH REPOST v3 16/80] arm/kzm: drop RAM size fixup
Message-ID: <20200124091051.566db9b5@redhat.com>
In-Reply-To: <84zhedx161.wl-Peter.Chubb@data61.csiro.au>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-17-git-send-email-imammedo@redhat.com>
 <84zhedx161.wl-Peter.Chubb@data61.csiro.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: meIjkUDwMravl6EhFMqRog-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.chubb@nicta.com.au" <peter.chubb@nicta.com.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ucYuA6y3RgKz

On Thu, 23 Jan 2020 22:23:20 +0000
"Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au> wrote:

> Igor> If the user provided too large a RAM size, the code used to
> Igor> complain and trim it to the max size.  Now tht RAM is allocated by
> Igor> generic code, that's no longer possible, so generate an error and
> Igor> exit instead.  
> 
> You can add my 'reviewed-by' to this. There's one really minor typo in
> the comment (tht->that) that you may wish to fix before the final
> commit.

Thanks,
will do it in v4

(considering that there are already fixes to
the current version, I'll rebase and repost)
> 
> Reviewed-by: Peter Chubb <peter.chubb@data61.csiro.au>
> 

