Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4733557lfc;
        Tue, 1 Sep 2020 09:20:48 -0700 (PDT)
X-Received: by 2002:adf:e4c5:: with SMTP id v5mr1799685wrm.320.1598977248718;
        Tue, 01 Sep 2020 09:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598977248; cv=none;
        d=google.com; s=arc-20160816;
        b=JxtAgXQ7iS3RMLEdHzOXQ7IFQgyKUdjvDAHSsy83hqicHjfnzt3WoiBH6I5Rl9IWu7
         ifbDduuafr1D2n6Z7tdGpczvUGgNg2HleojdSMbpi9SdsiAUsv9j50cf9TDHTt11Ybeq
         3ymx6UcEIwkhtj1KSoL1qV2vggBTaQpOSax3qSx5EYRTmQ/NVeDQmO+h0uVRRzeUs8AL
         uOWrg9piFr42lUO+x88WcN7jktz5Zb5KvoC9C9w8YJukE+a94shHTmiKkBYiS8g4VoNj
         Yar/RDB5eL/l1b9hH0x1H54RvEH4H/0THfm3Uw8LwA09laEvo9IovAoA4N94f7Cg8lMm
         K5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=r+ff54JFzVZA1xf/CtI0lcOTvEDmVsQUJVgQUJBztPY=;
        b=U21XnHbTqAB4juuOkmCXp8Qu7uOtjmc8s0EQBztTs5/v0b0arYToPKciSoZUgWAFw3
         PERvS/StuG1dQfDWyNG3KIH78rZjM75qlC/XtPmOtfe2vwVpdto7RRLzoWsEugHDswPo
         1/DyuNKFHN7m/OsnjtCFq8exK3BktenQQi9nrD5ouPbln0GfAY8E57jifCyP7ZHAnYOE
         YdqaHoZeb02Ry7BLR7eza5vO3ihBctREFUxleoQrIAu+VG6cpxwrR0Ba3OAQY4vjGnny
         Z/BIVZ9g8zDwvKNpEmS2ULwHRCJ0bm9WaJk2lGmSnl5CONwYDyHWAP+nsxKYVD9wkId2
         tagQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J0StlPXj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l1sor1171461wrp.20.2020.09.01.09.20.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Sep 2020 09:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J0StlPXj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+ff54JFzVZA1xf/CtI0lcOTvEDmVsQUJVgQUJBztPY=;
        b=J0StlPXjbXnd5JPnGj/VHBPTeN8zCva7KqMyfPLkBENc+feP/ay0ssXWhCkVcyd8u3
         yuP2rHT9SN3sCi2B5/gB5b2LprCXMx0ZuVhtmwyk0W845C2F3cBXa0vJnr/A/GSdx+ph
         QUDm5FnVKaU2MUU77W7Ql+9sTmfRyHCW6WOz3/AKy9uVYudMck3J+esxvhf9ojZ3UYe6
         YOX89FIjLVHfWlD/nc9QxgI6GOF433Ci8QlHNJOE41E1i5yZhdAHh3FD+1bijJZ5pbxn
         lkDW4SH9vsfvIaFYfo+QnrOACs6UkmQSvv9jqGUpgJALnec7BPnTDu5NhO7lxZksZqWt
         d0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+ff54JFzVZA1xf/CtI0lcOTvEDmVsQUJVgQUJBztPY=;
        b=AQZO0wDeu4aJ2Hc6EufkqbSy5tnvzg4keKBuwPYl9yuc29kA9sVu0s8fXsSUgdTWwt
         R3ElBrq2ABxMrV8GpF2QxTed02j6hPMcSwyLKC7ozLkywx212vDyb7LIU0EvSqE9GvOS
         jFDPr5aM8jPuNFvvShsDRECHY9ULSzCNKRi16ny2RZCQgta6T5ygxsiltGW2aFUTlBue
         oNgqGil1kz5mMr5KGbcMhIVNgRSvD+Qv7GdOwrg4TcZehUZBLUAKUe7YzyaBMVHFWqh5
         K+RyYWRiwGqjSgW1CFm7skoaUxGrrZ3UHNbv7x6O9iMo+7Rq9LK/Ffp7tH1VZ0lg/qHp
         ozMg==
X-Gm-Message-State: AOAM531vvTpN3EBgvZcSWYQXmJ19Jp7G5VsYj8G4/Axfyn1Ww4wwijZ0
	lhoUncSfu8R2KBMSM21PYSuD0Ltgnmb3HMP+GVI=
X-Google-Smtp-Source: ABdhPJyOEjzyA79UXpcz4qPajS0mHCWTEWfhNCx+iITLIMeHg9upGiScBes3nw2csKnCYkK9h8Oj4g==
X-Received: by 2002:a5d:4e03:: with SMTP id p3mr2700310wrt.354.1598977248427;
        Tue, 01 Sep 2020 09:20:48 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id c10sm3145097wrn.24.2020.09.01.09.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:20:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 0/2] arm.risu: two minor fixes
Date: Tue,  1 Sep 2020 17:20:44 +0100
Message-Id: <20200901162046.32670-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 16nxuVw6/zng

These are a couple of minor fixes to arm.risu patterns.
(They're a prereq at least textually to the fp16 arm.risu
change, and I should have sent them out with that but I forgot
I had them in my patchstack.)

thanks
-- PMM

Peter Maydell (2):
  arm.risu: Correct VLDR/VSTR U=0 patterns
  arm.risu: Fix typo in VCVT_B_TT pattern name

 arm.risu | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.20.1
