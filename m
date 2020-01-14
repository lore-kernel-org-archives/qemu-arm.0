Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5371332lff;
        Tue, 14 Jan 2020 03:17:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzA2kwhoDDJA3g2VTDLlgoiseuY5VYziqkODLhudH/8pLJNqDKrMFjoJdhNEfqG6X/fVd6H
X-Received: by 2002:a37:454d:: with SMTP id s74mr16644994qka.104.1579000643111;
        Tue, 14 Jan 2020 03:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579000643; cv=none;
        d=google.com; s=arc-20160816;
        b=bSdFMvJRgRc/N8k+DAah85G5sKXT0btrx6wPJdRMcnF/rjMoE5SgHiLgpEkMMAfMsF
         93cl1RUAJNiMHV9ZBIP9SXjsAOUD344Z5xUxM37C8kPPAXhvVl/nShpHNS9Sk/hUtRUl
         vK+hRTtmCxYCx7xEibVWxMQirhnv736fKtoEn+K79Qr8UzoBvZzKRtimE/hui/EMhVk2
         3psVdhOYZuorrvKaxEXBdGNzwPAXNws+SdFB/0ZG2yaTnsLqauGTfZHFOm0uv/+w/BRo
         msCRmR77eROjTjbQOVenwKMWOvdO0BIDIO1hhLMBY0G3/AVx7ur/JvPn4zAbRwgDFNI7
         NMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PkanoPOF5W/d/hIfHK4PAFGtwOaU4hbXASfwdt4t1fw=;
        b=Vv9/9SpAkvJOLNaXrvg6MwOyeSfGK17059zi6yP9Hh/OZV69O2OJ5V2FWONYTm2DTW
         7TGLR3gaHkknBQeh9vlmuK3Aq5N8Ez5bLEYI/Q/pESXUAnqUVGlOmtb3Z2w19AmUmV1F
         G8k/BWnTNP5QHUFKoa1+AL74t72cwv2itpTuoZ4nROO5SZQzHp4K8/e/W5T0CZcmpsEn
         fqScf3kog74Mpt8CNPRPacnKOxn4p3+kmKcHJJmNa6tMC8uROQXIN4orolQkLrmG5lTM
         969lWVlMKz1ZfTLvYZXJXuohQrro7iAIAAPy7pFo57g69lyT4i6rBNyyjUlcy5SoTM7U
         2wWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxPC+qVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i31si7790420qva.142.2020.01.14.03.17.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxPC+qVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKCH-0002Zg-S4
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1irKAH-00016n-4w
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:15:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1irKAF-0003k1-N8
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:15:16 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40413)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1irKAF-0003jX-G9
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:15:15 -0500
Received: by mail-oi1-x241.google.com with SMTP id c77so11409522oib.7
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 03:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PkanoPOF5W/d/hIfHK4PAFGtwOaU4hbXASfwdt4t1fw=;
 b=YxPC+qVt6GrgMiu1O8iO+pr+mnGgcEyhNOeRzBmBe5upCK0aFMk9JSclW1Q3f3n7rc
 AnANnZAtomXAgUCh6D/CMPwd849AQC9fMo2clNn1V0+4HnP88i2E4IYwE+a/dxye+EIJ
 xaUgxSIlpz/Fgf4bE5qa1GUvse3ZkouljAp4LxavLq/Mwg0hyxWJ/NgIB0eNiFyE7Nr2
 hX0WKtvkKUue1kHUwetnSIGMV8YtNXRDxVd2e/wAgshGxYnEUfO84gmrMlUYiYL5PzXB
 ePTU1+k4IOGRSvntsjekyqK6BRDkq1YMKxGE1KEtIVTGOgTlT+SloAU09nOZpOyqI3iE
 UEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PkanoPOF5W/d/hIfHK4PAFGtwOaU4hbXASfwdt4t1fw=;
 b=ZJK6Yf5OifvyDe647oCLYQGrsTF37CXqNq1+JbbEgHfRYBzLtdfUOLND2uLZVfLb7T
 dqzrcGIJSe+eogEOAytiNbSf5KP9uRRhf4h5bfRORwBwRBolnkHELsGNvdRW9rOXe284
 Uyxrrt9tPeZD6b6IVeqWWkWlq0YdG0hpf5pGpYeiOj7sOcKWlbwZ3kZfhZCAluI819Zl
 I6RS4iYzdl1I+qgsecH7spiqi/ZXbqPibrfOABT76/Ea3FMzFthe1kmztgfEWbu4RDWf
 sdBHebWPc8kPnlWo0qpgfLH5mmCi0BfD+j15HZNYZKCaYNv/IDY4svoWDbnXIOmHbdu2
 GYzA==
X-Gm-Message-State: APjAAAXMyp3LwAxCH6pojDPmhSLigR4zd/vDL8HIYAXzLv3/fAiVqiN0
 MrxUA+g6am5sNUWqP42fIzt6/1p240fhXw2FsDyceQ==
X-Received: by 2002:aca:f484:: with SMTP id s126mr15418659oih.48.1579000514604; 
 Tue, 14 Jan 2020 03:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20200114092606.1761-1-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jan 2020 11:15:03 +0000
Message-ID: <CAFEAcA-7aLrp4n9gtD=0MzmMDpzNyJCUpOmY2XPxNOun5MKeGA@mail.gmail.com>
Subject: Re: [PULL 00/29] Migration pull patches (second try)
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0zmGfo2o3vRq

On Tue, 14 Jan 2020 at 09:26, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d642cfa0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200113-pull-request' into staging (2020-01-13 14:19:57 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request
>
> for you to fetch changes up to 4eafab585c091050b5ae63130f46fe46ac919c3a:
>
>   migration: Support QLIST migration (2020-01-14 10:17:12 +0100)
>
> ----------------------------------------------------------------
> Migration pull request
> - updated QList patch
> - initialize local msg variable
>
> ----------------------------------------------------------------

Still fails on hosts where ram_addr_t is 32 bits.
Looks like you still haven't got the fix for the problem
Dan pointed out where multifd_save_setup() is using the
wrong type when it calculates p->packetlen to allocate the
data structure.

thanks
-- PMM
