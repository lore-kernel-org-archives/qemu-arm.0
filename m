Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp764597lfm;
        Fri, 17 Apr 2020 10:47:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypJBgmi5REXn4iPmxEdAfFrLY8HYmNtzHql3mSG78Lviu/ghqLQyZiyZKhLD9xnb3Ft57oQh
X-Received: by 2002:a05:620a:308:: with SMTP id s8mr4573268qkm.436.1587145627541;
        Fri, 17 Apr 2020 10:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587145627; cv=none;
        d=google.com; s=arc-20160816;
        b=BZ7rJ+FJ8wdqyls1YFs/yAn3blG1b2LA+kn/Q8qaV3w8Ii93RTo2SDULcPsezVswDE
         vvW4XizOfAN6iaaqjrlK5XGyawwMgX8hrz6g3J+D0+VVmYtV5HwYSODkIIROpjqNrLvF
         SZ1c1HOfp9EPiiHoX5Hkbv0AiApugDDnUO0vLW27WcsU3hiJYRwaaqVy5xMkqJ6LzTUq
         ghyN/NgLrIJHpOQbBSn6O51nMtdh9jUx4cJmpkbxz0OaVXBF/ZVy+Wc23/HrIkcOIMMz
         UsWoaoJ5IhTxmWMhv7pxbp4y6pRTteLhe6gXHi0HCbBAbo6K7ziTPZZJsyZeyP/jQRtJ
         pfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5RytxVrfUiR+oBHUbS2vsYUgPfTlYWpl2yZN+midB3Y=;
        b=RR05122MrfgYd3Rmdvjj0hfmRVjeVRNYmamQKep2M3u2HFsGEQ9Irna3Uymmc4ri61
         gENfFXnRDtKMD4ZY47TS1xH7qfkVZOVEDCpo+zrrAb5/0MAvgkMfxWRm8juWwxX/LjAw
         WQPp422UBa2JJCNnlXy33QIbx3EQPqo83M3M/8us0bwZXlkOzJon0CjYE8I/kRx5Kphc
         MsXjiEQ623tHTh7KHvDEKASo3mbupfC8MjW2ThT4pBJmtt3jDwp3EX38Jbtn9eCJwzxu
         QUzMWfQ6Xv42OcY8rsGQkjsh/pLI5iYTqxtQSm1tvn5SdqbfNRs5w2bPt78xGYvAG0a3
         BLVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fIVDy2S8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si3343352qkm.296.2020.04.17.10.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 10:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fIVDy2S8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPV50-0001nk-Vv
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 13:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPV3d-0000fm-8t
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 13:45:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPV3a-0007q3-KK
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 13:45:40 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPV3Z-0007kC-9E
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 13:45:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id e20so2134721otl.2
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5RytxVrfUiR+oBHUbS2vsYUgPfTlYWpl2yZN+midB3Y=;
 b=fIVDy2S8GH93ksuN9ddoIe780fuEIzc7m5ijfzie5/tX9g9DU/esn/IYMeQI43XJzh
 adNg65kgVGHp4BWmFOLuck7wocMngxGUGiyIWPXGn8jqkAbRu7gJoGWFXWbccZY9AT4O
 1dod/0Da+1UtUCa+skFGefmEzoVl41BmhaSqcT2M+dnV+qR0iCiuF9GbDxYvED75qDjx
 fBtBnS5DKMhM8XmQdWBQ3X9nLnbGx+Lehu20dOBcm0d2m0tKED6fsa4Veh/L3r/Y+5LK
 Zpq7GrQV5rQoCBrlOch8+V4WuhSg8FykugOh/DGSMq3d4bn4LCXXeoM3yRpBUxqAi/zr
 vb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5RytxVrfUiR+oBHUbS2vsYUgPfTlYWpl2yZN+midB3Y=;
 b=F+W5ZB1oIgPJtt1PsjajbsiPU2HCHWda7/0NwmOAowYVpylBqLeatPH2sKkr+zA7Tl
 584ykMg2dzHlsgkAZSibe0DizuBqysLmiurK7CB2gsIYn7u3hAvZ1fTLCTqQ8Nt8LCSP
 NKkqkJxOG9JSBd2EsYMnd5Olw/SdDSjfL1bOcD5i6JNP8xHge1lmDQ2qLhyiTNRXjet2
 gOQjYHhPgUcMmidpeTGKfbyKLG/abCR9bEb8dLvum2KYtLfe8M+4qSGa68YYsKmTeia1
 gHMPSuju+7+qhpDJr/9PLMCPMgeFbzym47kwQmmw2RHJlgnW4xf0IbRXnkkrGSrxf5xY
 SkqA==
X-Gm-Message-State: AGi0PuYLd7VRErUnE7Biubw0lgpSJZp7iAV4X/XoR5BoMt4FEjFnVj8U
 +iz065RCOFVIe3cbGKoFPQRvUDpTC9mb/2JM25NHzg==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr3420001otj.91.1587145533313; 
 Fri, 17 Apr 2020 10:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200406135251.157596-1-damien.hedde@greensocs.com>
In-Reply-To: <20200406135251.157596-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 18:45:21 +0100
Message-ID: <CAFEAcA_+tLQO0P1Wo2Nby1zyH458_yDWd-9Odw7Adjc4NvQmzg@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] Clock framework API
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nczfs8jRWigt

On Mon, 6 Apr 2020 at 14:53, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi all,
>
> The series has now been fully reviewed and is ready to be merged
> (obviously not for 5.0). I did this v9 to fix the small typos
> Alistair spotted in the doc. I've also rebased the series on master.

Applied to target-arm.next for 5.1 (with the two fixups I
posted earlier applied), thanks.

-- PMM
