Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5986578wrr;
        Thu, 14 Nov 2019 13:01:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkaQPIBCBonhMB75x4jJ2jvk6ZN1Y/iTnDlwkanKWX0Dl2mv0BBw1F2x4E23MO1J9vl5nR
X-Received: by 2002:a0c:c125:: with SMTP id f34mr9887710qvh.22.1573765307788;
        Thu, 14 Nov 2019 13:01:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573765307; cv=none;
        d=google.com; s=arc-20160816;
        b=Terq6LRpaX+tYmvHUpbKhulkSYZyhzNkFks9cEqsPg994bKLUPiIIUWtW6JZVndjc4
         KlIy0ZQFNrCs/vXDhpXyBkDrttzxY7S4m07wD5/uilXPS8tWIPZf1UeVfOKYWioe+thX
         C0aZLHZbzR1L3m6/fdU9kT7K5pCenq5vOgAOYZ58yDAQk6pVIuXh+jAVOjwe+7sUBmjx
         UdLMU+RaXNW5Yi5rfy/ERUkpA836XUSW8OzBEe34yop+Xn85F0MabN4W2R63UrnhvjL+
         MImXyxKuqaTtCgMZHnjn4lDhpb2BwjTia7BPK2zNZbZtJpW3We/mwyFQ6ISMDQMOXKFN
         bJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKkCEwXFwbZmbzc7S9qEOq9pI514UvvN5FVNw3ZSjB8=;
        b=viauRpjWBxWmclkcAi91qXlXLQnz99p7uz6cXDrL0tOaEMz18cm9P96pQGYV1sRvXo
         ZWaJx5TtOofHZ1sC6vfsxg4uymXSV3CTcrPoKtMfqK2mtYo4/1VtfUC0Ealvv/yXLz1f
         +vOatOi2G66FT4HkTI1ZxpQCgfT/ss25w2DVVGDTiZKQMuQN5NIa88GnU/+5iTy6nxqH
         ozIml3Bavvrk+FZFQ7SfFbeOIoQ1HvabwJKmnQu5hVzCQRvMasTDAAfsWAQQftF9TJxr
         SJfqvYofkolKoQeWAbJnoBJxm29ZwT3mStI1E6h9rjL9HutvRXxjp5e06N8+iCYsyo49
         7BsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eioyA5ae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si4512954qtm.50.2019.11.14.13.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 13:01:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eioyA5ae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVMFO-0005SD-Tt
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 16:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVMF9-0005Qj-R7
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 16:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVMF8-0004Oa-Rx
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 16:01:31 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41543)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVMF8-0004Nv-Mb
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 16:01:30 -0500
Received: by mail-oi1-x241.google.com with SMTP id e9so6611248oif.8
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 13:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKkCEwXFwbZmbzc7S9qEOq9pI514UvvN5FVNw3ZSjB8=;
 b=eioyA5aerfLPynUJ5id/moMDEDJNUx6ic1RLp3lBPy5miJCtOvwOe6d9tZF0kjNLjs
 EUVDtPAiq4E1RDAJigZIMvLYv4o5b8AAqWjWKLu3B6pj+6tmP5x9Z6xhzTHCZIcXlYiR
 ambgLzrgIe6rOQ2r5BGkCMKPHlMZDJPmUmyni7LiSgdccZOmvG06R8r+4cyXUpdp97a+
 KomrTr0Y5uId+TUX2XBD/sz7G+hKd1fNzwMCvVjEkgwNJxU/NHhVg3agbeqt5JV4lMuH
 QX2D66MXZl0vAXJYqFzPbuHdi5k5VRzBmGDmWHiC00F8N3c17PUI5WLwYKVTOX6GK7x2
 RgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKkCEwXFwbZmbzc7S9qEOq9pI514UvvN5FVNw3ZSjB8=;
 b=C610iClNQVFF+rKw+oA/DvMkUJjUO69JHxAAkw2FwlKeuZmBZb5AqAJb365KWjE5yp
 Ok4f/61KOUx/RdNJmO3d0lTapnOkX3I04DC0kuj7XUnYRFIj6p5tLCgJ6JLjoQ163Cf4
 ZDk9D/r0crocKsXsrj6hJDuHS2LEUlrd/vGnowcJgqqP+2aqkhxDaC91TNsuc6hSYBvI
 mY4Qxqu4zhUNOHqRys8VrL2//GH8wPVS/+58wGku/kffbZ35Z1i2IeSFyCQKDNU8RbK1
 O25oN7U+hnPLZJ5A6S5B+jrGdMPErJlL7wUpMiuLtH8AiY4p3dzySfLavr99RNvaqBic
 YZaA==
X-Gm-Message-State: APjAAAWDfVYkytjO4fjHu66DwwCyB5nhO67etqVxqoareW4VBxi4WwVd
 ElQf6Oewu8rCo2zwA7AEWWehIH1CursdGoLzBJvg2g==
X-Received: by 2002:aca:451:: with SMTP id 78mr5375158oie.170.1573765289704;
 Thu, 14 Nov 2019 13:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20191104115228.30745-1-graf@amazon.com>
 <CAFEAcA8zkR_MZ-28Nc=x4j05U9MsFYfzQtkHxTf65ZwacK020w@mail.gmail.com>
 <246a7cd4-7c39-c92e-05c3-1045bca2c114@amazon.com>
 <CAFEAcA_kwscZRqK5wTRu5WLkixGYbdV0c7mZMV6n+40DOS0-Mg@mail.gmail.com>
 <CAFEAcA8HwRNd+Mg91RJ1DpiyoNJKBWHjFT_Te16xTV5P7wV_ug@mail.gmail.com>
 <a3b96c16-4d92-87ea-32a4-f36a62cc857e@amazon.com>
In-Reply-To: <a3b96c16-4d92-87ea-32a4-f36a62cc857e@amazon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 21:01:18 +0000
Message-ID: <CAFEAcA8KyiSvW0c2gM3muM9i-CNSt9qjH0rTDZY8yGcKq0J+5g@mail.gmail.com>
Subject: Re: [PATCH] pl031: Expose RTCICR as proper WC register
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Hendrik Borghorst <hborghor@amazon.de>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lsWcD3FXs1Su

On Thu, 14 Nov 2019 at 20:45, Alexander Graf <graf@amazon.com> wrote:
> On 14.11.19 15:42, Peter Maydell wrote:
> > Is that OK?
>
> It's much better. Will you just fix it up inline for me please? :)

Sure :-)

-- PMM
