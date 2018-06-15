Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp603623wrq;
        Fri, 15 Jun 2018 02:06:00 -0700 (PDT)
X-Received: by 2002:a9d:7391:: with SMTP id j17-v6mr413012otk.169.1529053560510;
        Fri, 15 Jun 2018 02:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529053560; cv=none;
        d=google.com; s=arc-20160816;
        b=YKXIVBUPVTXBNleA88zhlqm3Vrkri5sR8LMc0O0yprdETlVk4chxsQ7BUPJgGk+4nZ
         I4l677+7+0DhgseQhLYU326fMEnYFMuaRPTd00WW7QeuqWtIIDvCgc/v+J/771GDZzix
         A+befTFpK1cMvWXnu54eWmMH1ma8o3MxFTKeDuXiBahPsvejL8XZWykaY0VoKhpJj0I5
         MNKG7xsA2ilKTiBv4PX2DFQPhZH/MB7Q4L03TK3JvvwImaiwTexNNDKNt0KBNawiwJom
         uiJWSf2O1c40f57+8jlqRJxkbdtJqA9kjdwWnxtG0GrJkbGwoLWquGGq76m9GCJjBQ5Z
         M41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=vFhaTu7iXI89utVan5Oz5wUQU3VHdJC3vkfkXaai4vg=;
        b=JkuZLkmTtqDuYo1FAy6asno1dKZeewowxILDPQnf/wU8B7QPuuPQr+GE2eWFscHhTu
         xBAhuU2y4P189zQ55ns+HTjrcQI/rafUNSB1AF/nLxPVo3Iu06y9MrAEDlFseDkKPX4J
         Y0sx5eBZvXmmGYL53gybn+AtJjh2Gmmb273jvh4uxNOceRgjwku6BykISAFFEfOWXbUM
         mWc/OVqlcFsSeFWwfV+U1S9rZpCm3Psr6+OSqMDlbAm8F4j/7etkj5rYwNn9KXqf1ui7
         Ki8A42y4+dOm2UXkxZuPRPnqaNQYVdKL5kJCOfp9uyy/KZfd8WIbd55saQGEpIg9EYMY
         2JPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zl/YT/Pf";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p197-v6sor2934830oic.182.2018.06.15.02.06.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Jun 2018 02:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Zl/YT/Pf";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vFhaTu7iXI89utVan5Oz5wUQU3VHdJC3vkfkXaai4vg=;
        b=Zl/YT/PfUPivJSlNLt4h9ULF/y2sD1Q2vVYRyZtpQZ6TDnof1aZ2rswBwRObcxj5T9
         B3eTDwsPnnqd6HM/6R+hVe25+8DwmrlFVgzKelNMFoSGFqKz4Q37qH9gIyc+yY5ri47q
         Pcvk0L98bd/3GA3bvF0wcRDnskc4bbEaXdEoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vFhaTu7iXI89utVan5Oz5wUQU3VHdJC3vkfkXaai4vg=;
        b=koYHDRxwyrZdIWQHWZdJqrIXEiAKvRuOdUlK737Fs/4raTdQMoYR6Jf/tv+vKDFpGP
         QhD23a16Xe3lHLa+eAzis8aPlbXb4oK7Uy0HlBwLRW+kX0X82qmU5JgSkX+0a5HiKo3u
         DgNSqUSQarDRWgtDRW9OgmnfQhJc3SpH8MSBP60CDXxvdjss27cJW490TcHKyUDhyAEJ
         zCHBVBgwwCnDtPu1uGjgfrbPr6YVSfH3sR32EmfpANNyBY4G6oz5pPng9BmWpgKLug1a
         JzsQAzG9eXOivgIG4FO2Dl3/GTSBrplxtF1TLGUGgWH+mKUr099bTI2eWwxo3HFlMPtE
         v+lA==
X-Gm-Message-State: APt69E0MGNJ4JgbNQASEfhyZigMVxP0+Oytf41gZIErIK9Oak3w/1nit
	U8puS6QrNI0WuPeQQy3Y5QfFtmWEVNx6ygoU+BqPmuUM
X-Google-Smtp-Source: ADUXVKK7AnhdoFtx51GhnO13I1n13ZIRzIwuUSNeZADkCe6aFpYxbqjUOGI0A+ZtNjTVCrIw5tO/xa+ddO4weS6c59E=
X-Received: by 2002:aca:bd84:: with SMTP id n126-v6mr370320oif.337.1529053560152;
 Fri, 15 Jun 2018 02:06:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 02:05:39
 -0700 (PDT)
In-Reply-To: <12713e19-d67f-2196-7fed-5552d2aa95d5@redhat.com>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-7-peter.maydell@linaro.org> <12713e19-d67f-2196-7fed-5552d2aa95d5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 10:05:39 +0100
Message-ID: <CAFEAcA8ZPAWD8JuvOZYpMC5xBBqJqY_KtytXBkO-_tzoLtkKUA@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/misc/tz-mpc.c: Implement registers
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: JTPlHSx6DlJY

On 15 June 2018 at 08:23, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/04/2018 05:29 PM, Peter Maydell wrote:
>> Implement the missing registers for the TZ MPC.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +    case A_BLK_LUT:
>> +        r = s->blk_lut[s->blk_idx];
>> +        if (size == 4) {
> don't you need to test CTRL[8] before doing the auto-increment?
>
> spec says:
> "A full word write or read to this register
> automatically increments the BLK_IDX by one if
> enabled by CTRL[8]."

Oops, yes, definitely.

thanks
-- PMM
