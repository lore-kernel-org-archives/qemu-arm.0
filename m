Received: by 10.25.85.209 with SMTP id j200csp1103843lfb;
        Mon, 13 Jun 2016 02:37:24 -0700 (PDT)
X-Received: by 10.55.182.131 with SMTP id g125mr13119107qkf.171.1465810643284;
        Mon, 13 Jun 2016 02:37:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67si14622794qkc.258.2016.06.13.02.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCOJ8-0000pj-PE
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:37:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOF5-0006Q9-Dc
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:33:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOF4-00008M-6w
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:33:11 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOF3-00007w-SH
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 05:33:10 -0400
Received: by mail-vk0-x22c.google.com with SMTP id u64so59910388vkf.3
	for <qemu-devel@nongnu.org>; Mon, 13 Jun 2016 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0fdsRgIb4j/S80CvGn1SPalgo7Ncq+Of8jGfIqAsYRQ=;
	b=Z9cxP+IkYjzzAZB0GLWYx2MmYwcxJz5bbp2ytHHG0S6NNwxtNVT6OoXDrwWF8f/zS8
	MWwJba9dULyn5BOZ1mqNd05J/M1IL2CTuhkrIKWeHe2NQt53BJMeWF7FiL4mEWtLGLZq
	UftHy/enSxWfeAPeXajHOobnGONGBAsVujC40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0fdsRgIb4j/S80CvGn1SPalgo7Ncq+Of8jGfIqAsYRQ=;
	b=dgoXnVZ/jm7ZnQwscC69vLOrbAqjXkgs5JEzPY7DDkknUHFMqtti3XCagRpgq7wS2g
	vKetu09FxJBG3uR28abwGQHHqWWGqhRNDAvMIr0Loj7HzjyYG1JLMrGhCC74kRVVyMGz
	qiptIRZFeAe5PoC8xJ1wCj6vQtW/l9Fe0O5+GXCZe7GpDEdErR+JVhtNYNMbYb898x+Z
	7sRMhiyV1rCt2XP5LAxuVTTSI51ex2gvEv9rJXjA6dl2mprkusgRG3ewkk0nKpA+QzJ3
	ugj5K4VILx87CKSQ2TrOlLk5PcV+lMFci0aaNJePN79nY8gqw/m+gA9p3rwn2RlB0oEf
	Vn3A==
X-Gm-Message-State: ALyK8tIe13W3xMG8oSPmV3pdALEEl5b8pek7ejTKXD1pZ7QnbRjwk4jfUzhK2io8qzdzvGKGZ26FY3LAzu+MmNi+
X-Received: by 10.176.5.227 with SMTP id e90mr6314625uae.4.1465810389436; Mon,
	13 Jun 2016 02:33:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 02:32:50 -0700 (PDT)
In-Reply-To: <1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 10:32:50 +0100
Message-ID: <CAFEAcA8cqrzJn1mQbqRD4R6w+XJ7BBcUZ4537tG5++H-oG18-g@mail.gmail.com>
To: Vijaya Kumar K <vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-devel] [RFC PATCH v1 2/4] exec.c: Remove static
 allocation of sub_section of sub_page
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Vijaya Kumar K <vijayak@cavium.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oMrzJEKUZOE4

On 13 June 2016 at 10:08,  <vijayak@caviumnetworks.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>
> Allocate sub_section dynamically. Remove dependency
> on TARGET_PAGE_SIZE to make run-time page size detection
> for arm platforms.
>
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> ---
>  exec.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index a9d465b..e803a41 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -154,7 +154,7 @@ typedef struct subpage_t {
>      MemoryRegion iomem;
>      AddressSpace *as;
>      hwaddr base;
> -    uint16_t sub_section[TARGET_PAGE_SIZE];
> +    uint16_t *sub_section;
>  } subpage_t;
>
>  #define PHYS_SECTION_UNASSIGNED 0
> @@ -1151,6 +1151,7 @@ static void phys_section_destroy(MemoryRegion *mr)
>      if (have_sub_page) {
>          subpage_t *subpage = container_of(mr, subpage_t, iomem);
>          object_unref(OBJECT(&subpage->iomem));
> +        g_free(subpage->sub_section);
>          g_free(subpage);
>      }
>  }
> @@ -2272,7 +2273,7 @@ static subpage_t *subpage_init(AddressSpace *as, hwaddr base)
>      subpage_t *mmio;
>
>      mmio = g_malloc0(sizeof(subpage_t));
> -
> +    mmio->sub_section = g_malloc0(TARGET_PAGE_SIZE * sizeof(uint16_t));

You can write this as
   = g_new0(uint16_t, TARGET_PAGE_SIZE);

thanks
-- PMM
