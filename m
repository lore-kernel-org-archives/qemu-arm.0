Received: by 10.28.173.206 with SMTP id w197csp1940080wme;
        Fri, 12 Jan 2018 06:54:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBotpBpWj1thuevZVWK5pXhnCAazm7GO4tjk8sc6+y5iWoTPvrVgk+ZatRvCn9WH2sdEIwbUx
X-Received: by 10.129.27.12 with SMTP id b12mr13514936ywb.489.1515768898573;
        Fri, 12 Jan 2018 06:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515768898; cv=none;
        d=google.com; s=arc-20160816;
        b=szp9WMIx7OpnpP9ve04bp7QPgpIDELSXdgWcqs/UtCBvIBSfnBY1G9G+iO8Xz8uY1b
         JqoKDmdl6WBUYLDQeNkWt3xjoJdwPu5neUbvhiEFyVq7rTjeBrtunOqg7TPbcxsGtlST
         FcC6IG9h/nk82sfu0P6WC6xWJq4lMaWoXvsyV/Dl3kizCrHABPEYhdUEf+xIKjbQY3gP
         stNZXnS55jD1Lam6Nrc5Oc9Um6x+VmVNaQxumB25jTGkzU2E13QPxYe78rvssODvX1WR
         q2soEgDXOBwHdDguQDXk4RwIJjx7aNhcB15SKsvJkPUUhxIkSy+eRQEnMAMHBScKqUeS
         rUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=EJGUtQpEdIWh7cLPa0mVsxjueECSF7j3pnxTOZffnoU=;
        b=X6uNF5iANPIQy/vdH7k/4UU8A6EnDT2qulBYTO6hl5vNkloTsLFa999B7hDtoFdwfX
         P6Y34RlQh6ljL9LRE6FWu9n0BbZT6YLKLxclcEvsu7zeU/j7AT/ctn3JRMULrQFtOC7r
         yr8Aeem9V7cyI5x4FTfoVcJz7FA2bsPWklp4eLkmZzXghcz0VRnrJdMKDyzc8SZtZW/i
         MXmIKY4dP3DxQfSEGSVMKIOk+cG0YWcHC/iDJIisUBINhqdEeSq28wZWGxfW/p4Mq5o2
         oBVDFv7gg5jE3RRqS4TZlrWLTX5Hf61cEsqySIBv6uIlOhrzo/dmk5tfHX51DFqRMRIr
         WMpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gNcSVFjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6si1628972ybh.463.2018.01.12.06.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 06:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gNcSVFjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea0jS-00058E-1g
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 09:54:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea0jD-00055u-Vr
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 09:54:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea0jA-0006aM-AT
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 09:54:44 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:36676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ea0jA-0006ZT-4n
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 09:54:40 -0500
Received: by mail-pf0-x231.google.com with SMTP id 23so4550069pfp.3
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 06:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EJGUtQpEdIWh7cLPa0mVsxjueECSF7j3pnxTOZffnoU=;
	b=gNcSVFjWg7M4asxpHalp3VutZ9NNggwDgCD5kyaJs1mifcoyiOracdEdsfqI5ucsp9
	rpAQtAEOo0LEIb9RCrEQXlLkSJ01GXwpXY7WGBVwHyj/2lre5BBl+OADtzqrtShkfQLG
	1fe2sVlIOP4TAQsZbvZ57vXZvkIvYsYED5SvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EJGUtQpEdIWh7cLPa0mVsxjueECSF7j3pnxTOZffnoU=;
	b=bbOVc+/exTy8iR0kXLz9nmxNzmWpr90jE3ee8ljLDt62Cxgf8qrVmtNMi+J1GUdbaH
	kH4DGgqX6d7No7KbMvye1VJvi3aqhxMDIWBDOI3UID/GyII2Q5kVqKgrf+45QOalI9jo
	dNeqBycQ2GbzZIVfZtLymDllPFoulF4vHuK0VoM4WFaX+B10fQdcEqhJmn2Cd87ijbgR
	pEqH3Xlj7LkosK8zHKMouEw9SJjCJpWGrauOEdM/JWa8vKqoPq9RBo252RLo7CZA6ukm
	mBYkh5PmafnduoyjRDX/7NzhcLLsqyJ5zs4zZjjyN+ydYKxPoDNbBLFhBbcqMve8m99H
	H2Dg==
X-Gm-Message-State: AKGB3mJb9rWRWRMZfrfla6SJrlqc4WWG72UqyLMSUFaoCBw1MPjIZvKd
	dmL9B2QjpH+AY0inxEASgP2WJzTqttc=
X-Received: by 10.84.130.66 with SMTP id 60mr22206143plc.376.1515768878346;
	Fri, 12 Jan 2018 06:54:38 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-78-183-178-static.hfc.comcastbusiness.net. [50.78.183.178])
	by smtp.gmail.com with ESMTPSA id
	z19sm43122702pfh.39.2018.01.12.06.54.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 06:54:37 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-2-richard.henderson@linaro.org>
	<CAFEAcA9A85CnzizK8rYNZCDgmszG5NL3=1QOetTcOS3gijzCAA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fad4dbc5-251d-48af-d092-a10b1d945caf@linaro.org>
Date: Fri, 12 Jan 2018 06:54:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9A85CnzizK8rYNZCDgmszG5NL3=1QOetTcOS3gijzCAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
Subject: Re: [Qemu-arm] [PATCH 01/23] scripts: Add decodetree.py
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2PWKcKcsJQl

On 01/12/2018 03:57 AM, Peter Maydell wrote:
> I asked on #qemu-devel for some review from people who are more
> familiar with Python than I am. One of the suggestions (from
> Marc-André Lureau) was to run pycodestyle on this and fix the
> (mostly coding style nits) reported by it. (pycodestyle may
> be called 'pep8' on older distros.)

Thanks, I'll have a look.

>> +# For unnamed_field, the first number is the least-significant bit position of
>> +# the field and the second number is the length of the field.  If the 's' is
>> +# present, the field is considered signed.  If multiple unnamed_fields are
>> +# present, they are concatenated.  In this way one can define disjoint fields.
> 
> This syntax lets you specify that fields other than the first one in
> a concatenated set are signed, like
>     10:5 | 3:s5
> That doesn't seem to me like it's meaningful. Shouldn't the signedness
> or otherwise be a property of the whole extracted field, rather than
> an individual component of it? (In practice creating a signed combined
> value is implemented by doing the most-significant component as sextract,
> obviously.)

You're right that it's not especially meaningful.  But since I use deposit to
compose the pieces, any extraneous sign on a less significant component gets
smooshed.  So nothing bad happens in the end.  Which is why I decided not to check.

> Do we syntax-check for accidentally specifying a field-def whose
> components overlap (eg "3:5 0:5")? I think we should, but I didn't
> see a check in a quick scan through the parsing code.

Probably not...  something else for unit testing.

>> +# If any fixedbit_elt or field_elt appear then all 32 bits must be defined.
>> +# Padding with a fixedbit_elt of all '.' is an easy way to accomplish that.
> 
> What is a format that doesn't specify the full 32 bits useful for?
> Do you have an example of one?

No.  I'm not sure what I was thinking of there.  I'm pretty sure the code
doesn't allow that.

> I notice in the generated code that all the trans_FOO functions
> are global, not file-local. That seems like it's going to lead
> to name clashes down the line, especially if/when we ever get
> to supporting multiple different target architectures in a single
> QEMU binary.

I was initially thinking that I'd have the translator functions in a different
file, and because of that they would of course have to be global.  I had
thought far enough ahead to add command-line options to change the names and
prefixes.

But as it has turned out, putting the translator functions into the same file
has worked out well.  I should probably rearrange this.

> Also from the generated code, "arg_incdec2_pred" &c don't follow
> our coding style preference for CamelCase for typedef names. On
> the other hand it's not immediately obvious how best to pick
> a camelcase approach for them...

Yeah, auto-generating names in different ways is tricky.

> A --help would be helpful (as would documenting the command
> line syntax in the comment at the top of the file).

Sure.

Thanks!


r~
