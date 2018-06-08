Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp572378wrq;
        Fri, 8 Jun 2018 01:01:42 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKF3lkqd24Y9vXluOYvrgy4cD9Zo/wouXvo5PI1T6czGqZ8T5JYusOvfbI/4odHy07k5T35
X-Received: by 2002:a0c:d610:: with SMTP id c16-v6mr4728754qvj.126.1528444902607;
        Fri, 08 Jun 2018 01:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528444902; cv=none;
        d=google.com; s=arc-20160816;
        b=JJK9yzAc8ZbNsNG2xVsTtAz1DmmR+HJrJRsa5zqIwfpsnNw9evkoQNhDo2O3d/E6G4
         tpfX/O5xOzCjNY+DJo32IJhfmus4+exSLA0/aLIf6KNksP//xvUDsUpAUXp3AAPDCWhd
         US92Ey+sz2Yu4rDXI2OYl9PExS/TWweh3s6xn3FYpAATToIohjPQS+1iN7YW/DfMeTqn
         Zcy7Ef73C4RGzeHuTHSxr12NFqajkigechES2iagjHI/xV4dIWOzFhfkH+W+6Rgx6bl4
         Fpdqtw9Yp7bxajf12d6xhSwS5CqXtE4cGJTMB9wjtBlLmhA+bczb62E4SddDz1OzyfuO
         8pKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=ImTwnJCykFbDaczldA7E+skSvs9aOlw8dWhFs4nt3No=;
        b=fUenxjrc7oGVaNQnK7SZ6MtwkNluXbLXhq88EhVCKAbqkNJ8jjw5Pnc69fd7sXHltx
         xTMPuW8vMzirhIvegRWv/SBWXfmEH+I5k9DW+k2AmCjdAY188hAe5TTsQZ6RulEDKALp
         2Rc53y/zPs3sRb2pkLWe6xsV8zesFBrT4PmRUjEokkbjFkFsOF++nZ/IeO4wlw8X+6eK
         AKNzlI52bP6PoIrRBovbpmjSdWx1QZAIQHb4E0oyuCfperj3dpZTobua+Dr7nZt94EgR
         rPYCI4ekMd0TLTXy6DpTSEpZ9Xddsw6Xl7gLjFATf+veOaimLo4jXCQjb/3mnuYiUHY5
         3i/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c5xIJ+d5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k54-v6si3123017qvh.151.2018.06.08.01.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 01:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=c5xIJ+d5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRCL8-0004oL-5M
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 04:01:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fRCKv-0004mB-GQ
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 04:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fRCKq-0003qj-Pp
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 04:01:29 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:38498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fRCKj-0003lL-JV; Fri, 08 Jun 2018 04:01:17 -0400
Received: by mail-wr0-x22d.google.com with SMTP id e18-v6so4121646wrs.5;
	Fri, 08 Jun 2018 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ImTwnJCykFbDaczldA7E+skSvs9aOlw8dWhFs4nt3No=;
	b=c5xIJ+d5CXlV4ftc/HXepoRFTRf7fZ1BQX7RaGTsGtN8EKeINvaG8BNbc1R8R9Pv2+
	yEsLTWDQLUpdJgBtcF3mevhykYHE+IEMwRtzvVTxJDHrXBwJsfYTgYlenqm9zPP+dkvW
	Kvxu0UyAUY1BU0wjGzeQBYV7DcU+e+S47rdcGKyjZR6sxuh843S5RcD51AJE74P6GbSZ
	rHzDxqYNkS5X15W1GOkYjUW2KcCmzV/B3T7g717egkKIFXJs5NSzfZ07p4q/9L6XfYN2
	ALRWguTaBK1p9LTxvhtkzjzw9rM6/1kc/j4xCsCpDHRmZ2ZtdxOy6iq5QKJbW5Hk+UsZ
	9Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ImTwnJCykFbDaczldA7E+skSvs9aOlw8dWhFs4nt3No=;
	b=ACR9AZitQ9Y4Dx6lpQ3rY99JyktK0+5MfezL5Y4CTWjgRXL8oWkJ7hSaTtcP1Pkoah
	FZUmAO4MHU6vrbPVOU7zoAL3Y3/fYwR8mt5GUdwiFQWs6wI9p/PgLDYaKKvy+dHyaFQi
	uxrbpQlk8ViR1aS69hjWnOJxyeCQDkGieP8vMzl4XKw1tCY0RUkpNFB2ucj7zdV5RTN5
	v8M1N8+WjZBZJHI8FJT8c5jzqDJTzIl96RQV3kDYk6pBfWz7M1SPymFrQw2vI9MSjda5
	mc5GZNv9Dan30ITFh25vbTPh29EYI+DNj+grLCCHKXnI58s0+Jc9RMdDAhTmDTml8Grf
	zbTA==
X-Gm-Message-State: APt69E2PFOmCIC+FU8QKAAJWchO8o0e81l2as4OTnK16LZsNSierHpKu
	pj83RR+NrBPJue9ULJP+1yQ=
X-Received: by 2002:adf:e084:: with SMTP id
	c4-v6mr4024484wri.199.1528444876571; 
	Fri, 08 Jun 2018 01:01:16 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	z83-v6sm1196354wmb.8.2018.06.08.01.01.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Jun 2018 01:01:15 -0700 (PDT)
Date: Fri, 8 Jun 2018 09:01:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180608080114.GG29183@stefanha-x1.localdomain>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
	<CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
	<20180604101221.nhvjum467ier3txx@sirius.home.kraxel.org>
	<20180607102455.GD19032@stefanha-x1.localdomain>
	<20180607125853.5hcd2bhhjedfngre@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Content-Disposition: inline
In-Reply-To: <20180607125853.5hcd2bhhjedfngre@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [RFC v3] qapi: command category to stimulate
 high-level machine devices
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Eric Blake <eblake@redhat.com>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KkrDaQqfeAdm


--BzCohdixPhurzSK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2018 at 02:58:53PM +0200, Gerd Hoffmann wrote:
> > Gerd: What is your preference?  Do you want board-specific fake displays
> > inside the QEMU process as the long-term direction for UIs?
>=20
> Well, it isn't the one or the other, we could actually do both.  For the
> deployments you are looking for the websocket approach proably works
> best.  Being able to do at least simple stuff (say led display and
> a+b+reset buttons) with a fake display, without requiring setting up
> something separate for the UI can be quite useful too.
>=20
> Your call.

Okay.  There is an existing micro:bit web UI that we're interested in
either reusing or at least closely following as a model
(https://groklearning.com/learn/hoc-virtual-pet/intro/2/), so WebSockets
makes sense for this.

Stefan

--BzCohdixPhurzSK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbGjfKAAoJEJykq7OBq3PIno8IAMQoVKl0Ifhr0+2Mbv6sBmdG
K2IDEwmfNDjo3I2phNewRe8QBHOMqvR7TfHJgYkS5/fP07uN8NdaQIY8gc7mzPzW
ONkKFPSEnAXw4r9WODs3YXhvB0iZaGTgJEQ/s0Qi6nfollY7y706aShtZHl69V0k
/+NkGK7E3QykB88pshN34RQh6RBMxe5oED1PxQHjOwoEYmCKCRg5v2dbwgLlIlbK
PvF8z9ptYRqCSVpdJtW0twMUiEExqaJxNrfVP83JM3+LYWuUazcbZq5hiW33XV1N
J7bMAmHA2qHoNY5S7tON5QY20pEWqKgZVjpmUpzDVyxlyO3fPWHWIEsDp69DdoY=
=I4Z6
-----END PGP SIGNATURE-----

--BzCohdixPhurzSK4--
