Received: by 2002:a05:7022:611:b0:8f:43c:4b5e with SMTP id 17csp3071590dlb;
        Tue, 5 Nov 2024 11:55:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIZ8VYyBG/IhiaApCszLSZo5CIBR42hRpkI4vEfJJltfWVVwH+IqI3VjAQI26M2O7Jp7bCqGscuDdTBw==@linaro.org
X-Google-Smtp-Source: AGHT+IGYEE7eYvxc4AO9qZPfJRdxGNL+jQrm4FaNPaCbUooMpEeAOxPCwdIMtC9mX+IVauFIzBDa
X-Received: by 2002:a05:6122:3c46:b0:50d:39aa:787b with SMTP id 71dfb90a1353d-5105cee2303mr22952624e0c.0.1730836506343;
        Tue, 05 Nov 2024 11:55:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730836506; cv=none;
        d=google.com; s=arc-20240605;
        b=CILMwB2b0dRU5gpm2rOAJNZBE6nvqROknNzj0dNEpTWCEZGqa3RCvwy3xQXoJQen/o
         8AFoFP/Q7llZubUYx51WGlN+aywe4LH3uIw6ZlUoJ2M05hr1QGcdS3EqOLJa0kUHV0P7
         bWUQiHwG9hvVirnUSn2livYhmgon82HR6O5MyHpJhJkIWwhbs4JXUKAVeidpRBbwx29u
         HVa2PE6M5smod86s4CbLegWgRR79vnymB7GkpxYqj81PQ6QpaVi1iwWJLJGAboki4Yy3
         T951/tM4/lmfO8zOflKC0PSTHaIvxS/4Nu0Xfs3nelP/lYiM4oO0KJZgwlkqAWCxMMbB
         BRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OmO/yvZbnYpkNp7dAyYz09oOK6ndjH8HBKv4zKmb+SI=;
        fh=58XMCArdACVdznP1Z8OFrXPdIyyLGijYvnCJBM1YpgM=;
        b=MTvqh2ZEQTk31BsSp71/e7YyVdGUpfTRUr3DRQXpu2lZsgam4VuFqnUfWEi4PhlqfB
         1w3avsUS7q/P5droz0gR0kzOBBZb3d23XIPMepkdjmOuxUElb92CseFgpkEsS3mfQTRa
         H4tYtznOcY8/kyd7V0UPpdSOeC4j4XSlZzlnAGoKReGX9UOzdt83bPEPAr4EFnm0X13Z
         6RDPkNBy4nE5AwwawXcTq4u7p1RQiRRFmtHdHOKhFlz/U06sFcF/FlCRjIgUcyfIUKWi
         kva0t7f+LI3QIwCR6J3NLrFSqs/9LZyYrw7s3yPGA8B3r/tHkz7ltBLCLngq+pp0nnz3
         SeYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ofY0Wz3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ab4d55si1413530185a.583.2024.11.05.11.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 11:55:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ofY0Wz3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8PdO-00022K-H8; Tue, 05 Nov 2024 14:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8PdN-00021o-O6
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 14:54:37 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8PdL-00072N-RT
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 14:54:37 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c957d8bce2so3120206a12.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 11:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730836473; x=1731441273; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OmO/yvZbnYpkNp7dAyYz09oOK6ndjH8HBKv4zKmb+SI=;
 b=ofY0Wz3OaiyID6vZ3LRv+q2wAKkhJ1cLEpWlc7bx8elkMDE1UlTyUIQTaO1BXVLCso
 GFLVNzDAbDjjghPzLdaF1c8eJgxPJiTopWL3Bpc5tq4P0w10rZJA4dMK/6kCLL1IWJs2
 YrUL8fpba8whguj8cuGZGn4Wryls92aY4ZYHNvo3E44IZR10N9SeRmEV7xhLvWCIxyIB
 0qjiP95OO7FGpEMZKvd4DfZ+bFRZWleTn8SVpVjbIIXUSOSu8Oho3BudqJfxQz1yVmUU
 VRihGWcxoub8WOiUVwuPNdYLGrmCzjHcrvpBIiTwBwvcfaQaC7kHRlZkFTOvlLOm3mnA
 OeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730836473; x=1731441273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OmO/yvZbnYpkNp7dAyYz09oOK6ndjH8HBKv4zKmb+SI=;
 b=gRvPL2oxmJFXljgMG9kFOYcYBcYzEyzCt5YvDKM4Yp6nt3qMoKqJF8xJcjrAtjIHLM
 B3fbiAKXwByMNdo/DiFbOi0X+nG9r54g6BeLb0wbwUqVaIj4xyJA9MdKKy5x9icbL6tk
 k1tTeshpfmJYA33H+MENTlW88YcvNQMQJineelByYMb6HMCmchDU8OUsM4m914WuxYw3
 cdDkgpBeAxHfsqwR03f7OoYhhKADCKOpxS/v1zFqPsDXxPNKRc33ZwZy0dMdgxUuZJ7w
 M76RcubP0N/qcL271OM7NKkgD2gzc6bBzPpAbt0HFRPrQcoJJ1gQPthBOMlKF2+xqBFX
 vEOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLQGKUp5ho2R+6YzM0/LFXr3HgjfPGTEuqUETUOeKQ7mui2+a/tx3qG4JMOa3/AENP3VyD3Gk8JA==@nongnu.org
X-Gm-Message-State: AOJu0YxXtRnCSZOxC1yGuLZSjJoD99E70AgwKpIFtfoYdtdia5CmxSP3
 8pL5NWW6Z86YPEaFo3ElJeJLaplUeUSbayUZNt5JSVMUoPj8m4UswWgu1ZP6aCyPw+LXLzRWnIA
 aBrir3vfVssLtEXE7r4zYvSlHqcWvQnyFgu2/eQ==
X-Received: by 2002:a05:6402:35c9:b0:5cb:6696:4e31 with SMTP id
 4fb4d7f45d1cf-5ceb935a7e6mr19088835a12.22.1730836472680; Tue, 05 Nov 2024
 11:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20241024063507.1585765-1-clg@redhat.com>
 <20241024063507.1585765-11-clg@redhat.com>
 <CAFEAcA8A=kWLtTZ+nua-MpzqkaEjW5srOYZruZnE2tB6vmoMig@mail.gmail.com>
 <91c2ac92-66b2-45c8-b4fe-e8f8587b0e9c@linux.ibm.com>
 <CAFEAcA84hhWu2ouirfDPbCpq_=QLQxAf3k47h0Pij8iEnOVj+A@mail.gmail.com>
 <2491bc60-9a0b-486a-8f6d-2c4c94332756@linux.ibm.com>
 <CAFEAcA85g2nX3MU5RzmBvAHT8Kis1JHhiEaBvnFFbEQkG+0OxQ@mail.gmail.com>
 <e6c33df3-49e9-4b8a-b7cb-d38c2ebee3be@linux.ibm.com>
In-Reply-To: <e6c33df3-49e9-4b8a-b7cb-d38c2ebee3be@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Nov 2024 19:54:21 +0000
Message-ID: <CAFEAcA9La7y1Z2-nMnJDyC_p+z-3c0EnDzEE=w5LTYtRnXPT1g@mail.gmail.com>
Subject: Re: [PULL 10/17] tests/functional: Convert most Aspeed machine tests
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, lena.voytek@canonical.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BT997oykMG81

On Tue, 5 Nov 2024 at 18:36, Stefan Berger <stefanb@linux.ibm.com> wrote:
> On 11/5/24 1:12 PM, Peter Maydell wrote:
> > On Tue, 5 Nov 2024 at 18:02, Stefan Berger <stefanb@linux.ibm.com> wrote:
> >> On 11/5/24 12:13 PM, Peter Maydell wrote:
> > Is there no way to just have apparmor not apply at all
> > here? I can see why you might want it to apply for the
>
> If you are root you can change things. I have shown the options using
> aa-complain and aa-disable that you can revert once the test has
> finished: sudo aa-enforce /usr/bin/swtpm
>
> You could also copy swtpm into a user-owned directory but you will have
> to adapt the user's PATH. That's an easy option.
>
> The most compatible option is the 3rd option since I would expect that
> we will have this rule in a future version of the usr.bin.swtpm Ubuntu
> profile provided by the swtpm package:
>
> echo "include <abstractions/user-tmp>" >>
> /etc/apparmor.d/local/usr.bin.swtpm
> apparmor_parser -r /etc/apparmor.d/usr.bin.swtpm
>
> > case of "I'm using it as part of a sandboxed VM setup",
> > but in this scenario I am a local user running this binary
> > which is not setuid root and it is accessing a file in a
> > directory which my user owns and has permissions for.
> > This should not be being rejected: there is no security
> > boundary involved and swtpm is not doing anything
> > that I could not directly do myself anyway (as you
> > can tell from the fact that copying the swtpm binary
> > to a different location and running it works).
>
> I am not aware of how user/non-root-started programs can be generally
> made exempt from AppArmor.
>
> There may still be a security boundary if a user runs QEMU and swtpm was
> able to manipulate (with malicious input) the user's files in some
> undesirable way or copy the user's data elsewhere. In this case it may
> be desirable for the user that the profile be applied and the PATH he is
> using points to the standard swtpm.

But our test makefiles could equally well just run "cp" !
swtpm has no privilege here that we do not already have.

Anyway, the thing here is that we run swtpm like this:

 swtpm socket -d  --tpm2 --tpmstate dir=/path/to/somewhere --ctrl
type=unixio,path=/path/to/socket

where we use command line arguments to tell it where to
put the tpmstate and the socket.

Either:
 (1) there are places where it's not valid for us to tell swtpm to
put the tpmstate or to put the control socket
 (2) it's valid to put those anywhere we like

If (1), then swtpm should give a clear error message that we've
given it an invalid argument (and its manpage should say what
the restrictions are)
If (2), then apparmor should not be rejecting this usage

One of swtpm or apparmor must be wrong here and I think it should
be fixed. In particular, having the failure mode be "something
goes wrong after swtpm has successfully started and only once
it gets sent the TPM_INIT command, and the information about it
only winds up in the syslog" is pretty awkward -- it would
be much nicer if it failed fast, as soon as you ran it, and
printed the error to stderr.

In the interim, since we'd like to be able to run the test suite
on Ubuntu, it sounds like we can work around this by putting
the tpmstate and socket in either /tmp/ or somewhere under
the user's home directory.

thanks
-- PMM
