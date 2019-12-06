Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp853893lff;
        Fri, 6 Dec 2019 07:00:02 -0800 (PST)
X-Received: by 2002:a05:6830:1116:: with SMTP id w22mr11319975otq.63.1575644402519;
        Fri, 06 Dec 2019 07:00:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575644402; cv=none;
        d=google.com; s=arc-20160816;
        b=lRkSPo6/Gmo53P4KhlKEvAYEP9c5yhpYzkalrLlYhaRKvp4LXuiWvh4rUEbWqcuvxh
         Xc/cGmu88u1SlXHadJX6IvMcEn0egaHVbeoG0khoIL/TTMglwBx6m1vvtPCdMsVA+eUI
         vq2fuD1w8cFrXT3ABu1OD/RLhnD10m9phNSahGQMjduHFsAAqvaibcuibWGjdkrygXmh
         SiVrbVpBo6QAMq0KNjM2kc2WzdCal0JvaYKx9TFi0FYogjznWfT+AUtx5GvB6SBJQBp+
         CvzRT3tc9RC8gQwdOGBgXaTT5vD/U6BateT3M5GOJLX1QLn37vgfH0Uar6dLdT3+21Lj
         PWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eOLM4an9fc0aqxUJp71/rlPAB5BObyJXmI160pSiPVY=;
        b=tB5qShSneHtfAobzlIjRsWkvqQozxiqc0qnmQ1DpLWXi8MexFG9CbIQEsthqQ9QflT
         Asapwxct5O2PhqrVoVS7W5rjUgpHWoq4nhOMPOjUciFmutuaKIfCh4WvhfEMBwiJMOhP
         /SJXt+lDPvddSVJny6Sw2DfR/gHxJeoJUNucj1oR4S/Ti92byfzeL9738OOPt2Z9a4rU
         Ybb8wpbGH9A5KZWNLvWjic6XbLTV45c+84WsFa4Xk01RgkeEv4Q4qbx6gXUW4typzttZ
         4n8HyuJqE5QnDPsx0kwWfl6x+PNw5tprv/XPMY7zVlkm2jJ5LOj4HgX8vC0opD1cypOK
         niJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxIK7zx7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 5sor1022150oin.33.2019.12.06.07.00.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2019 07:00:02 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxIK7zx7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOLM4an9fc0aqxUJp71/rlPAB5BObyJXmI160pSiPVY=;
        b=zxIK7zx79X/dzDCJPrU8k6TPGxbecc6UbR4y6TTpTz3DjhmKeLDYXeZiP9fAVd2Y3A
         PYo0Uy4IG9YJNo2tXj11Dny0gOc0ZrxXCwTfYBOMy21rbjFknJNnJGpMeWALjYt/J9KF
         hABouP+p+xi7D9v3ne1hk9EGDRuAsTm6x8g0/n8r1g5lLAUCui4OV5IPqV2KvIdXbV/h
         fYmBN7Xnn85UyLkXcXx5ZTG0HP487OrdOz5b6lu8eZb2ZY0GweAvUgNnQhyCqrbDSKcg
         d81tT0aNtFZ61rzrLNaYqeZVPixYEMVZm425HU3H+Ka6EQIhQeuptbt9e06mpQdJnAzz
         xbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOLM4an9fc0aqxUJp71/rlPAB5BObyJXmI160pSiPVY=;
        b=mRZr56Uc+QWk9l5zGe836B7zQOOY1voXZdDTpW/+hLYdezIobFCkD3suYFoPI2z4A0
         WoNN7EHikdzMj5SuWzVunqmxyxj2kxOm8Kk65J5Ce1B2pNbOSiFBhw802d23kU6oDLf2
         98wNlYmngp1QuEvIHmtRUenxA5OcWpwgSptdz0uNMKKHYbDXFe5CtGz+CqqRufE+z7gZ
         OIYEDr3oHP8XT+ziSopi7qjJJx9Z9sJq6C/p/4h3RrvFVO4POdfQUy7Kkp9F7tecH0I4
         WCca1rdPna/7pr+dnMGJfgSm9w5NmFR6yJs5YUfS2q2mGNcZEQQqa6ESQmcGwyc5Zn1i
         iaPg==
X-Gm-Message-State: APjAAAVP67xt4XDmHsqqbPVThMWHSfjXwGA1fMtR1n89e2JncI1IzFLK
	9ZitTU152jbOgsVLZyq/PNacoziRZOrmvy+rawu6K6p7
X-Google-Smtp-Source: APXvYqyW8BtYV2mrUNt67h9M6TKKFEoFrbE5dXdkMxeaeMaRe8xgyZT0Xqc3AaoWPU0qkfYGiYMREuLsB5IboOOlODg=
X-Received: by 2002:aca:edd5:: with SMTP id l204mr12877351oih.98.1575644402117;
 Fri, 06 Dec 2019 07:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20191121000843.24844-1-beata.michalska@linaro.org>
In-Reply-To: <20191121000843.24844-1-beata.michalska@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 14:59:51 +0000
Message-ID: <CAFEAcA-8gm4Ug=NVONfXN_4Ek8uL6NcjqkOzpOpsSBMXOHmUqg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] target/arm: Support for Data Cache Clean up to PoP
To: Beata Michalska <beata.michalska@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: J60J8VmT9Kwo

On Thu, 21 Nov 2019 at 00:09, Beata Michalska
<beata.michalska@linaro.org> wrote:
>
> ARMv8.2 introduced support for Data Cache Clean instructions to PoP
> (point-of-persistence) and PoDP (point-of-deep-persistence):
> ARMv8.2-DCCVAP &  ARMv8.2-DCCVADP respectively.
> This patch set adds support for emulating both, though there is no
> distinction between the two points: the PoDP is assumed to represent
> the same point of persistence as PoP. Case there is no such point specified
> for the considered memory system both will fall back to the DV CVAC inst
> (clean up to the point of coherency).
> The changes introduced include adding probe_read for validating read memory
> access to allow verification for mandatory read access for both cache
> clean instructions, along with support for writeback for requested memory
> regions through msync, if one is available, based otherwise on fsyncdata.



Applied to target-arm.next for 5.0, thanks.

-- PMM
