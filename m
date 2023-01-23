Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3160513ejc;
        Mon, 23 Jan 2023 11:32:34 -0800 (PST)
X-Received: by 2002:a81:53c3:0:b0:4fb:2ade:d783 with SMTP id h186-20020a8153c3000000b004fb2aded783mr9479574ywb.42.1674502354276;
        Mon, 23 Jan 2023 11:32:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674502354; cv=none;
        d=google.com; s=arc-20160816;
        b=yqgwdAi0uaMx8ekQQvoqTn3+MgUBkkjesS81PXcY1bKD0arCAVyHwbrWjiH451QlD8
         Gc29RMm/PbqdehdVyMJFFEoq0lE7fQzoX/HRy1qR4JQAgzNhIAUkSrBGjhngQxhsJgSr
         VIzGgvJNotEl12Ku4THPkq/qtLozwD0nGlcwXzwB6ey7ew4xHbiqWMtovArsf/BzUTSG
         JH+lG5hpvOBR5dNqxkI64OaVREPj6MIQ23PBIXhaOxHZw5c8pccHWzbqLeZYatRX1KPO
         /ktUQl6dkNQZy46EGySzqIiRriw98FQG6IdG55fWtA+NGVvmex6Wuo046ShC+ZmoyFwP
         yU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fyu7loh/4S0RtxnBPpU5tf2ttu1n/1GeQWJGnBAEVUM=;
        b=P/HTEi9quQpHj251oZ9dQYO6nJGVlPJaQQ3sS/pBfcrny8DMg6bOKmsmvtP4iAwHeM
         H9YveIrM6d7u2NKCMZu68MfXjlwlwfHj454KwpHB+9dKOLI3xpEuBNpk0sydwdt0my+o
         GKNTwwepTsnHQ/JevYOmJdcNEagzFJxP55wFSJAoW4vU/4P1g4/se7GuBT9/InpXIgnv
         EtQe6oLyVmNAfEAq4sPdt2tl1cVfrcOFd83UZQJbQqb4STfiMfd3CwtRQqwIHGxBBFYR
         q3Qm87OecPtYMSk7zQYdN8M6W231dc+Hy/7h6l3R17os/exesIZeZ/38Bs3psmghf1qi
         6X8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lYYFDSqa;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l6-20020a81d546000000b004fe80ec7317sor4435571ywj.128.2023.01.23.11.32.34
        (Google Transport Security);
        Mon, 23 Jan 2023 11:32:34 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lYYFDSqa;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fyu7loh/4S0RtxnBPpU5tf2ttu1n/1GeQWJGnBAEVUM=;
        b=lYYFDSqaSabk/mD38mrAE/be6JooOs/Np7lnMl3i+D5pbzY6tOfPZ+nuRl+Yxsyucw
         sDhAJ5ENOlAOTI+E8JHiAnBa6N74LRSVTIWiZxjntxgec19y7YpqNVoYt9sFCF59gge/
         vyN8coKFR/yuYDk3XwOWgo5S506PvYKAmC3EKYL8qXj0/aRP3KUbMnq7jbPLAUw6XPcO
         YJKkAsi9Ivx1OsB7OIJTobDf11UDMPTg8Dfkx7D8AM/HeZqq0J6u4z5lon7dzoDRlesa
         RHe7Yvu07HH1HGcvU/QUrIkQd9llwQWnkhZZEBIrZ733yfULbGpDCuNzLOLW0fVBAdAQ
         +aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyu7loh/4S0RtxnBPpU5tf2ttu1n/1GeQWJGnBAEVUM=;
        b=X/tFjNvrZVwkPZ8SxLTPxYQc7EWHzip9pGXK+NCZvVYxOWbvM8uBGPVEX7f7Y/qcMy
         KodkqIo7ol3OMwUV/KGdp2XYGkR/Tve2LQ8fkYLKwwWFMt87aHrPBuQ8AZZARfcPvWih
         vYh4Ioh2a1VM96krA4Yv+NgMe+hA03g/XBJ9NhSyO6u2J1DHwahyOIlyfvTRVbsziENd
         zT39vcD4CKBuJ8CDDoz2dDcxPyUnBYe8Ei0cpZUL3CFLANHV/ZWuPkWDYChWwxa7p295
         qA+Uf6uyT1v6qJIC1NY5UrGrTHUPA1YRwbzSGfFMezDumcGyUSmTuyXFchFXVAmkJbMK
         KX8g==
X-Gm-Message-State: AFqh2ko6jCWh4jq6SOcN8z3Bpw9kHGRtH9qz51nHBIo5uaI1CDSx+NQ8
	s1hnIKohdcWvCE8GrKoqIJ1VtNaxAABDP56ma9o=
X-Google-Smtp-Source: AMrXdXtg02f228Al4WoRKjFI2jgcxJ7ExQq7KW1gjpPT/PhVuvBVt9T6cuLZCLR1PY5LBYzsGw3qaLd8rSS8ehvBx44=
X-Received: by 2002:a81:250f:0:b0:4ff:dbb6:158e with SMTP id
 l15-20020a81250f000000b004ffdbb6158emr1483723ywl.0.1674502353832; Mon, 23 Jan
 2023 11:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com> <20230114161302.94595-3-fcagnin@quarkslab.com>
 <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk> <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
In-Reply-To: <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Mon, 23 Jan 2023 20:32:22 +0100
Message-ID: <CAF8_6K=7qhJc7jo2jrzYJ6_SjKnbxOd_6_6CtdKJXwfJj5onQg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, dirty@apple.com, 
	Peter Maydell <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>, 
	Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: IB7bt5ZFWO54

Are you running the Linux guest on multiple cores? If yes, could you
check if the issue persists also when using a single core?

Thanks,
-- 
Francesco
