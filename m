Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp812000lfp;
        Tue, 14 Sep 2021 08:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfFXDprNjpJV9aDrzBEs4u6TigYL1CWwxyRa9xvK17ykyga8lCXoA2hHAcmO4xjxxlIJkF
X-Received: by 2002:a1f:a883:: with SMTP id r125mr9495911vke.23.1631634793661;
        Tue, 14 Sep 2021 08:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631634793; cv=none;
        d=google.com; s=arc-20160816;
        b=I/Cd8XrNPzidov0vC2FbeBM0D0c28c1q7ZT5EMuSPFItS/L+D2xDG3DpqBS95kXb9B
         KxpOYg0YvkgMLouqbbG4ZQubF5bFI1m7EP+8o0F8+QXz5TiVP6VNfEB5sjVwQt/jEbYV
         RyQX7wfLwPSGfnj/h4dgBowvtcQDvOhSPHYmuhYk+NUFa8fGpmdVQT8kj94/I37FYDCX
         uG47ORGSJKknNgUNzqzletpK3GE9Dt7hWTT1YoeVCdIU3AbWAV2oX5dD/PeLUFzWRJac
         ayIhup1+hMgKGIbGr+GeluTPpORdNlsdrxhGgl1R+M6wunyQFTTxVL73mxLciHGRhusw
         wPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UbQHstuguLGguwNwEH9yKdw3QROFtfW0lRABjmr0LcA=;
        b=tGrCwKTYhUEnp0AIyklh9E8DvhquJ1f8S9BBZiLDKmQQtKC5ADJL/MlRTRFIhkyLg4
         36buXZ7DJvkYAHpvyq6IauFclemvpQjqq4LmU4x5jt+9aUtQ8Nf50EGZIl+s4qbo0c1O
         UJpTH43yaqDRDQegLXA+tV0hvANh8sETXFVhaxOHKQT1a2RXdauGrvR2PYptfZu//lCS
         spwRbVlWOyOVDYYML/PtWz83Cb2GdbXdLhHivT+sx/6/zwtR50EyLQkvC8i3UKucmXaL
         3mWggZxfcoaOV6o2Y7BPzr/NfT/6cAFdK0swaxY0Tvo6XTyK/PzaDg6HJR9+1uTLJ5rA
         BgiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RDTRGxp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a31si4227978uae.14.2021.09.14.08.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 08:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RDTRGxp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQAkD-0001FJ-0h
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 11:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAhh-0006EH-5N
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 11:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAhb-0001G4-P6
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 11:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbQHstuguLGguwNwEH9yKdw3QROFtfW0lRABjmr0LcA=;
 b=RDTRGxp1ZMnATJiZhbY3zUE1c/FA9gQ/dzxvCA+DlDfg4IcwYNlH+f4+YulaDGfRvJsjNk
 9o5+5z3Z85OSNstJB3bWMhv2vQy235W4wSOvkZHSpjXILdYCJTvOFb+8X7kxEXDlfuQ+DF
 KVvGFO/4C6neQ2gwB64vfaB9qI3jbTQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-ZL8t8LLYND-buqU--qUOGA-1; Tue, 14 Sep 2021 11:50:28 -0400
X-MC-Unique: ZL8t8LLYND-buqU--qUOGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 b139-20020a1c8091000000b002fb33c467c8so6647432wmd.5
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 08:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UbQHstuguLGguwNwEH9yKdw3QROFtfW0lRABjmr0LcA=;
 b=rij5ZLtI36t1xBQFQlpuwLbIHBwPUwr2MbQ+iqyMNg5pw1cODhpviUD/BsBitrAiK/
 w2+/w8U5xYI0ZVMVI73v5chD1ncuZz0oL9152T02obyuAaoqbLtF8onPPXirrjUxLVxg
 DVSyxzKoIV4CkNEyK3ybJsCvm9l2WNdeMMupP7p7A+6+Mpa0ytBsBneleNshO0yi4Yba
 6RjHMC//ANNY1J+PerOWWHvcXgIcMO5xg+84YiRGNqQLTrMZXa7aKg6GN3rsfZxQd/DF
 qX+mf2U0beLaDS9t37115fzikVxFqFT9dkVr+gP1aT/M624G2k0IK4Z9xrBJMKx3fYqr
 DXmQ==
X-Gm-Message-State: AOAM5316kdUoMhH7ZeP6EVC2etErbXthPLKjF30QD3ljuuONKPBOxaWJ
 IsN0UyMhx5Hn5GSYjvqrHFaSH023w6L3gVxIuz+cvzV8F8G6urO8byglStR+0Q8l/iYcUSS6wU8
 RuZHj/pMirVfb
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr2886715wmg.47.1631634627276;
 Tue, 14 Sep 2021 08:50:27 -0700 (PDT)
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr2886670wmg.47.1631634627067;
 Tue, 14 Sep 2021 08:50:27 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id p6sm1386042wmq.48.2021.09.14.08.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:50:26 -0700 (PDT)
Subject: Re: [PATCH v2 28/53] monitor: remove 'info ioapic' HMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-29-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a8bdd82b-2784-faed-56c2-07071f0d5838@redhat.com>
Date: Tue, 14 Sep 2021 17:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-29-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 66xTLCUEDlV9

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> This command was turned into a no-op four years ago in
> 
>   commit 0c8465440d50c18a7bb13d0a866748f0593e193a
>   Author: Peter Xu <peterx@redhat.com>
>   Date:   Fri Dec 29 15:31:04 2017 +0800
> 
>     hmp: obsolete "info ioapic"
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx         | 15 ---------------
>  include/monitor/hmp-target.h |  1 -
>  target/i386/monitor.c        |  6 ------
>  3 files changed, 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

