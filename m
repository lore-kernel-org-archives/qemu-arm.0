Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23563279lff;
        Mon, 6 Jan 2020 08:25:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzanXqbUTCGcVJYuNbtY1ntDdFT1QxPpN/GQc9fOtuUOcuDNC1LtrOlpG0YYz/34XN1+P37
X-Received: by 2002:ac8:5542:: with SMTP id o2mr76651664qtr.387.1578327925180;
        Mon, 06 Jan 2020 08:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578327925; cv=none;
        d=google.com; s=arc-20160816;
        b=CflNxqQ/jNpply3cdraBX02FYZJeU2SJAfi4LvNQiha1HSHjxoBwN2mDDNIsiegVqs
         TAXiHQUJlDTzUhKvi0I5ZBffk9WKRjrs/Lhyd9CM7pFSsSPUAzWvTq76+FTQYQzKPzxz
         rn8TrD1AQZoN6TYIm3fU+lOParkt9UFdVp21zxFhwFf1KK4HiCE/N8bH+oprwBgfTcOm
         kfzMFBBnzafchWbw35SUE4GE8NKvyw08hggnqxqS6iZa6gGDsAKNSXMZ/Hokk4dBvw4o
         EGRPy8u/NW/zmgLS+V8pb4t/rKXV6mnL/gtzdAFPs5L9tYetPCCbZA3wFseFiz+r/rJk
         A9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=afpvrfThuHYg4jvcUDkMYQ9/0em1fUBxDS67JQzczDM=;
        b=HBlv9Ajc3k9gTdLDSk7y7Az29wYghW9c/GV18ODicH1pBI2vf5FD1bNgqx/DlWKjRI
         VpFYKzfQ9cu533onXrDS2VdxqB+FueAdp9Ma9Y9yMW7dNf5eeNFswol+aMgKibHq6trY
         Ef/z/OtqnjhPPLufdBs/k+lZUY+M4zm3vbma+52NBfXB1ejx5o5j/7aq2Yf0hvqOzh7Q
         siON7uP3tgMpYaLEJdSq422w8K1IPqVji4wXZLcxjaRXbNUWyx2eptqOdLofOgjSn4uA
         e+LvhgRTH7tYp5kWyGYjgXPlBIGxaAlq3WLwNYe4o2Vn20WEDN5KTHdTF0qm+J+V3e+X
         WQPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B2XPk2nm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si29669311qvu.53.2020.01.06.08.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 08:25:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B2XPk2nm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioVC0-0007A5-Dh
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 11:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVBp-000784-9T
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:25:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioVBm-0004R1-Qk
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:25:12 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioVBl-0004Pj-8Z
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 11:25:09 -0500
Received: by mail-ot1-x342.google.com with SMTP id d7so67911906otf.5
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 08:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=afpvrfThuHYg4jvcUDkMYQ9/0em1fUBxDS67JQzczDM=;
 b=B2XPk2nmWqCmEhy+zsy3/Sw70ozhA1MqTmHJdJ06PFUjjdOC/I2syh4w63xmnR8RQL
 HNg5KUCmXrurjQLFsMcKcZho8mLbNKBIe7MQF0sxQPcerOa4gLPw4oIIKMBB2ZUcdp6W
 1c8av52oDwwqb4AXPA/cyEypAWvIus6VnnZRolCe7di8WkR/JFoezA2xVuAR/wMQuHEq
 oZ7wsn7sK5TMxyIZj2RU1a/mxMhL+FtJ01fWaI7EV1+X6gkHs7WCgZhkk5qEdYHXi4wi
 /HfAad8TXk9puE2WXiHZPFo9Z4FvbgAChAUv72n3yxacWVsfx7MdeGywcXWtv9lfcNYt
 bPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=afpvrfThuHYg4jvcUDkMYQ9/0em1fUBxDS67JQzczDM=;
 b=Q4Gict+lKHsDZfeqohcyLALYQFT3zfrueEF7urXT4sqXlzf55xR7aatQKBy0BmweiY
 +5Tkgt5QsAqGOdQlzaWTSUMbGD9DU85momhM9lilY6cH34ozSVqqezt3U0dyj7O/3h1q
 5jydKdbwsEFJRiEfosipzpFIiLEHWv/ECJGc+7PEfu3r9ve2L6yjb8BRKK9PNjk7+xEW
 WRV4wzaCaCb9UlQViqMQelN5Qhp/gdtKcch1tsrTKgIw3z6btTDsTMCVSesHB67Ok4d3
 uyRlQk1N2Zhh3/LFFFJ8hTHJ8b0HN1uqFWjon2zRxYXZH9ACKB0gLjJDczQn7lDS/TYj
 ujHA==
X-Gm-Message-State: APjAAAVW0a4vcpm30WBFXZYRNpHEK7zzHEeLwTGaKSlYeDezvxBZEZEE
 ESijelrGT2zb5YMJD3gtDJcsA+1KXOS/AgqU2LcLVA==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr117537473otd.91.1578327908218; 
 Mon, 06 Jan 2020 08:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20191230110953.25496-1-f4bug@amsat.org>
In-Reply-To: <20191230110953.25496-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 16:24:57 +0000
Message-ID: <CAFEAcA-Zv7VuC1=SZHsbecisThLyDthuB+GMOpYP9j_9P3iboA@mail.gmail.com>
Subject: Re: [PATCH 0/6] hw/arm/cubieboard: Few cleanups, add acceptance tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8PwOj2mMcjg+

On Mon, 30 Dec 2019 at 11:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> After looking at Niek Linnenbank implementation of the
> Allwinner H3 [1], I looked what is common in the A10 [2].
>
> Add some tests before modifying the code further.
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg665532.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg666809.html
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   tests/boot_linux_console: Add initrd test for the CubieBoard
>   tests/boot_linux_console: Add a SD card test for the CubieBoard
>   hw/arm/allwinner-a10: Move SoC definitions out of header
>   hw/arm/allwinner-a10: Simplify by passing IRQs with qdev_pass_gpios()
>   hw/arm/allwinner-a10: Remove local qemu_irq variables
>   hw/arm/cubieboard: Disable unsupported M-USB in device tree blob [RFC]

I've added patches 1-5 to target-arm.next (but not the RFC patch 6,
which I've replied with my view on.)

thanks
-- PMM
