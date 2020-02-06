Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1642879lfp;
        Thu, 6 Feb 2020 08:22:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8Wvsqs706GMOurbmsObHDMrsFPCustpM9L7CbGaeroRJUAfC8Aa5WiharMwuYD2Z2MV7S
X-Received: by 2002:a37:e10f:: with SMTP id c15mr3249797qkm.331.1581006124769;
        Thu, 06 Feb 2020 08:22:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581006124; cv=none;
        d=google.com; s=arc-20160816;
        b=J73CYrsr5sRT8AVARr31AgxaidnOHwbgpIzFb9K6kZyzoCtWnJoYyzK0GPBQ4qINv0
         aLHeFSm9231t7vUT7/L/j4O9oVgS2hbB0rMit9mZOR1CiQKAzrMsj2YSsGe2jBWrUxrL
         giuflwWlqza48mATJbPtvkpkBYGU2y7CyNQiHowLFfhutY5bf/BAKymmsNFhOzm7mYz8
         3FhrovRPqT/Oz6W4L3eMnzQb7Il9IcZeRPST1wzi4HsorVNO1jHr8EFksMFKROua1tJa
         lAlAGi09mJ6y8zYIW44F74Bi/zKhBAUWu8Eir1thXrrW/tyi+ZLxSvckYbyo4q+Q9fkl
         QR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v96A85hSQsl+Wuu8aZMC3P0Vbqv63ZTHZqXWH6WOBBQ=;
        b=zknL+NTCn176St0Zuev19GHjCLGtBz817bQzWSe98ffdkp0vgrSeafzQGmzK1klhqg
         ZR96jQsgzTq0h6eF6bbA6R4RTKmSimtoN/e+haoqiDWpbtHPoEenrHuPzvvjp0D725OW
         140HaoFH2V5QJtfwicEQFRBNysuuqeloobQbJQkT9cmPfNN3JGwZIEcAkjJJEIKZrIh/
         TCP/ye6nt057OxUjsqrUdQHW3Y3TbgPMnJR2/W9jouaAEFqL/V281AdrJ2kXzY26ue3R
         jTGoLzGGdmXnqX0qw9K4K9o6UDVyf0FRKLC2nZkLJX6AnuCKqbglrWOPssdM0phPKFJT
         uskw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jjExA/+l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si1735172qtg.24.2020.02.06.08.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 08:22:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jjExA/+l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izjum-0001hR-6z
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 11:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izjud-0001h3-Pg
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 11:21:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izjuc-0007yq-Io
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 11:21:55 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:33277)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izjuc-0007wH-AO
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 11:21:54 -0500
Received: by mail-oi1-x22c.google.com with SMTP id q81so5179904oig.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2020 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v96A85hSQsl+Wuu8aZMC3P0Vbqv63ZTHZqXWH6WOBBQ=;
 b=jjExA/+lAdP0GFLnGUlqqZPgju3x+JrwDT4o6ie36ALHBcqxzCHLjHBm0EGKeZUfcR
 BO9xulremVUaVhDuPvmmSsZq8BWbKbVcpHxZGbNnWwbpvfuYTqfZnKTiFzjpueG+iWPI
 GFszHIYEope5cE3Noht9rLCRgxOEu3B2sdurN3vSOaihVSA2pmWrABVKVnvbO2QiOEvN
 Jqg2b+ovWWxYjECDwXdUibpobaj5h0EY4pI8KTZn33dSc6VZJuBSM+ao34/7b/uuzwg6
 P+MDWAhXSUvnO6BiZg3UFry4K/q/5krm+K32neAXKCbRTrgAaghwQ5zTDUr1MJOUOxM9
 Hxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v96A85hSQsl+Wuu8aZMC3P0Vbqv63ZTHZqXWH6WOBBQ=;
 b=JmBT5l7DEddN56Le9Dv+HCxARNy3BtSQ/n4QDq8xTSb3YGQ+P7WsytS/5/M/m72S3G
 DJpT4W1u7PGyB0Aul4QeNCIqBclG7WJH88natuJ691/k3T65kZw7EKEhcj8PkjCghNoY
 8YgXshcZxK+KNP0juBH2IzZNjHIA73V9NJsSf53HoQMp6GESUqaQOpe/FLZQKoZ91FKx
 RASv2Xm4U6fzpvl8RWcQAVJIb1sFbwlN3Kb3Lt5qqe9rdGhTJNVygF8rQg1EogPf623v
 EtIh0t7Bz4X0jQL1sW4jNk8yijhN2F9xxOzQ8hqSDsh47L+wDMcVFWYrz9H7JL5d5cIc
 jXTA==
X-Gm-Message-State: APjAAAWKdO4FqfKdRe0vbyj0P6ycZMg6vMvQ7Sv3TnppUNfTANPYkdXQ
 AfRk+m8Oy8sXV4k/t7gprt3EO/FPYwuT693e3QOd7w==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr7280033oie.146.1581006113321; 
 Thu, 06 Feb 2020 08:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20200206125027.1926263-1-laurent@vivier.eu>
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2020 16:21:42 +0000
Message-ID: <CAFEAcA_-8Qzamm7n6WBPZFHuMmMuHQ9fpzKZ+8TnBWQ0g=3vnQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22c
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZitxaJ4rxOlr

On Thu, 6 Feb 2020 at 12:50, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 7bd9d0a9e26c7a3c67c0f174f0009ba19969b158:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-02-04' into staging (2020-02-04 16:12:31 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 8ef350b32fe08d254f92a3a7efe89809397fff77:
>
>   MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines (2020-02-06 12:32:03 +0100)
>
> ----------------------------------------------------------------
> trivial patches 20200206
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM
