Received: by 10.25.0.144 with SMTP id 138csp1774974lfa;
        Tue, 25 Apr 2017 02:19:48 -0700 (PDT)
X-Received: by 10.28.94.194 with SMTP id s185mr11872095wmb.103.1493111988236;
        Tue, 25 Apr 2017 02:19:48 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22e.google.com (mail-wr0-x22e.google.com. [2a00:1450:400c:c0c::22e])
        by mx.google.com with ESMTPS id l41si29349832wrl.237.2017.04.25.02.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 02:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22e as permitted sender) client-ip=2a00:1450:400c:c0c::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22e.google.com with SMTP id w50so81873892wrc.0
        for <alex.bennee@linaro.org>; Tue, 25 Apr 2017 02:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=e/DWv0xzYtg+Dshe/h7iu0i4bCt2NAIn8Ys/qmpi1Qk=;
        b=FIhEwDUSOW3dR0BuGIiREaMzE3lUAJdM0QCyH0ZN0xflgGkPem86uVSpWhpwmiPMfs
         ZoFwIhpmzvZVVFyL4Ja3Im1muUXkPraaIbWFuKiB4xv+iCr5gXDaDLGAhzZ9tD2kkbv8
         fofgnU8YSPKZj4Ttne8fSQYrEydcJdUTdAPzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=e/DWv0xzYtg+Dshe/h7iu0i4bCt2NAIn8Ys/qmpi1Qk=;
        b=cBbPyhh1P3HryZSdi1tfTUkBWVwW1r+HAmAr5VearGsX7mkoRdR4u87fv78S9nTp3v
         EWb7NpLI+4WuhiOaj3TDpfn42AznLs8CNxkz4DHFYvSKwGjN5MW5Z7lNlc/9XQrrehJ3
         JP+Cn1qwN+RK2wNjmOdcMiUOl/MVEvQF786kq52fRykyW9m5734yDyWU6rIDZNWwvlYT
         SrVV7PsyY9BAtjsS8ruyhXhqobl7bYBL948It5FVQ2SZSodsSQZHPt0bJS/BEU5CgqZd
         lZk8jmj/3K2iiOEz1kfR6lzDNR+1Ea7tCXSLSyj8ZTjnDp82G9vFKCl3totY5iZMi7+/
         2zMw==
X-Gm-Message-State: AN3rC/77ItFcdOHShN7w2TTXXCFY1+YK4YpUhl1D8WWqCjZCBxVPq/Wl
	v/sxcfZ8RSVgqJ8/Kk/nCFqVHU+XulUefVGNRA==
X-Received: by 10.223.152.238 with SMTP id w101mr10090615wrb.151.1493111987831;
 Tue, 25 Apr 2017 02:19:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Tue, 25 Apr 2017 02:19:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2017 10:19:27 +0100
Message-ID: <CAFEAcA8QhyQUn0XJECvSYa3m0ws-44Dow0kE0h=eOJ83__iw1g@mail.gmail.com>
Subject: pull requests and ARM patches during May
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7k84Fty3vSet

Hi all; I'm taking a break during May and won't be reading work
emails during that time. Alex Benn=C3=A9e has volunteered to look after
ARM patches, and Stefan Hajnoczi has agreed to handle applying
pull requests. People working on ARM related patches can also
help each other out by reviewing each others' patches.

See you all in June :-)

thanks
-- PMM
